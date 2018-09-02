//
//  PopViewController.swift
//  StarWars
//
//  Created by Tomaz Golob on 02/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class PopulationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    /// The currently presented planet.
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let planet = planet else { return }
        
        imageView.image = planet.image
        planetNameLabel.text = planet.name
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "residentSegue" {
            guard let residentVC = segue.destination as? ResidentViewController else { return }
            guard let sender = sender as? Resident else { return }
            residentVC.resident = sender
        }
    }
}

// MARK: - Table view data source
extension PopulationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let planet = planet else { return 0 }
        return planet.residents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let planet = planet else { return UITableViewCell() }
        return planet.cellForPopulationRow(at: indexPath, in: tableView)
    }
}

// MARK: - Table view delegate
extension PopulationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? InfoTableViewCell else { return }
        
        guard let planet = planet, let resident = planet[resident: cell.identifier] else { return }
        performSegue(withIdentifier: "residentSegue", sender: resident)
    }
}
