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
    /// The currently presented resident.
    var resident: Resident?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let resident = resident else { return }
        
        imageView.image = resident.image
        
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
