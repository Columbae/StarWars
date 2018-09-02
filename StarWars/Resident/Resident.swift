//
//  Resident.swift
//  StarWars
//
//  Created by Tomaz Golob on 01/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class Resident {
    
    /// The identifier of the resident.
    var identifier: Int
    /// The name of the resident.
    let name: String
    /// The height of the resident.
    let height: String
    /// The mass of the resident.
    let mass: String
    /// The hair color of the resident.
    let hairColor: String
    /// The skin color of the resident.
    let skinColor: String
    /// The eye color of the resident.
    let eyeColor: String
    /// The birth year of the resident.
    let birthYear: String
    /// The gender of the resident.
    let gender: String
    
    /// The home world of the resident.
    let homeworld: Planet?
    /// The image of the resident.
    var image: UIImage?
    
    /// The names of the items.
    let itemNames: [String]
    /// The items to display in the resident info screen.
    let items: [String]
    
    /// Initializes a new resident object from a JSON object.
    ///
    /// parameter json: The JSON object from which to initialize.
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
        let height = json["height"] as? String,
        let mass = json["mass"] as? String,
        let hairColor = json["hair_color"] as? String,
        let skinColor = json["skin_color"] as? String,
        let eyeColor = json["eye_color"] as? String,
        let birthYear = json["birth_year"] as? String,
        let gender = json["gender"] as? String else { return nil }
        
        self.identifier = json["identifier"] as? Int ?? -1
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
        
        self.homeworld = nil
        self.image = nil
        
        self.itemNames = ["Name", "Height", "Mass", "Hair Color", "Skin Color", "Eye Color", "Birth Year", "Gender"]
        self.items = [name, height, mass, hairColor, skinColor, eyeColor, birthYear, gender]
    }
}

extension Resident {
    
    /// Returns the number of planets items to display.
    ///
    /// - Returns: `Int` representing the number of items to display.
    func numberOfItems() -> Int {
        return items.count
    }
    
    /// Returns the cell at the given indexPath for the table view.
    ///
    /// - parameter tableView: A table view object requesting the cell.
    /// - parameter indexPath: An index path locating the item in the collection view.
    ///
    /// - returns: An object inheriting from `UITableViewCell` that the table view can use for the specified row.
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
        
        cell.configure(for: identifier,title: itemNames[indexPath.row], explanation: items[indexPath.row], isInteractable: false)
        return cell
    }
}
