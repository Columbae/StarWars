//
//  ViewController.swift
//  StarWars
//
//  Created by Tomaz Golob on 01/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        guard let planet = planet else { return }
        planet.likes += 1
        likeButton.setTitle("\(planet.likes) likes", for: .disabled)
        likeButton.isEnabled = false
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    /// The currently presented planet.
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetOps.shared.fetchJSON(from: NetOps.Routes.Kamino) { [weak self] json -> Void in
            self?.planet = Planet(json: json)
            DispatchQueue.main.async() {
                self?.tableView.reloadData()
            }
            self?.imageView.image = self?.planet?.image
            self?.nameLabel.text = self?.planet?.name
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "populationSegue" {
            guard let populationVC = segue.destination as? PopulationViewController else { return }
            populationVC.planet = planet
        }
    }
}

// MARK: - Table view data source
extension PlanetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let planet = planet else { return 0 }
        return planet.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let planet = planet else { return UITableViewCell() }
        return planet.cellForPlanetRow(at: indexPath, in: tableView)
    }
}

// MARK: - Table view delegate
extension PlanetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? InfoTableViewCell else { return }
        guard cell.title == "Residents" else { return }
        performSegue(withIdentifier: "populationSegue", sender: nil)
    }
}
