//
//  ResidentViewController.swift
//  StarWars
//
//  Created by Tomaz Golob on 02/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class ResidentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    
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
    
    /// The currently presented resident.
    var resident: Resident?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let resident = resident else { return }
        
        nameLabel.text = resident.name
        imageView.image = resident.image
        imageViewHeightConstraint.constant = imageView.image == nil ? 0.0 : 128.0
        
        tableView.reloadData()
    }
}

// MARK: - Table view data source
extension ResidentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let resident = resident else { return 0 }
        return resident.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resident = resident else { return UITableViewCell() }
        return resident.cellForRow(at: indexPath, in: tableView)
    }
}
