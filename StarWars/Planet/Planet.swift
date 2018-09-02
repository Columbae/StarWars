//
//  Planet.swift
//  StarWars
//
//  Created by Tomaz Golob on 01/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class Planet {
    
    /// The name of the planet.
    let name: String
    /// The rotation period of the planet.
    let rotationPeriod: String
    /// The orbitalp eriod of the planet.
    let orbitalPeriod: String
    /// The diameter of the planet.
    let diameter: String
    /// The climate of the planet.
    let climate: String
    /// The gravity of the planet.
    let gravity: String
    /// The terrain of the planet.
    let terrain: String
    /// The surface water of the planet.
    let surfaceWater: String
    /// The population of the planet.
    let population: String
    /// The residents of the planet.
    var residents: [Resident]
    /// The likes of the planet.
    // TODO :: add saving likes to storage
    var likes: Int
    
    /// The image of the planet.
    var image: UIImage?
    
    /// The names of the items.
    let itemNames: [String]
    /// The items to display in the planet info screen.
    let items: [String]
    
    /// Initializes a new planet object from a JSON object.
    ///
    /// parameter json: The JSON object from which to initialize.
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
            let rotationPeriod = json["rotation_period"] as? String,
            let orbitalPeriod = json["orbital_period"] as? String,
            let diameter = json["diameter"] as? String,
            let climate = json["climate"] as? String,
            let gravity = json["gravity"] as? String,
            let terrain = json["terrain"] as? String,
            let surfaceWater = json["surface_water"] as? String,
            let population = json["population"] as? String,
            // TODO :: handle the downloading of residents
            let residentURLs = json["residents"] as? [String],
            let likes = json["likes"] as? Int,
            // TODO :: handle the downloading of the image from the given url.
            let imageURL = json["image_url"] else { return nil }
        
        self.name = name
        self.rotationPeriod = rotationPeriod
        self.orbitalPeriod = orbitalPeriod
        self.diameter = diameter
        self.climate = climate
        self.gravity = gravity
        self.terrain = terrain
        self.surfaceWater = surfaceWater
        self.population = population
        self.residents = []
        if let path = Bundle.main.path(forResource: "Boba Fett", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let resident = Resident(json: jsonResult) {
                    resident.identifier = 1
                    self.residents.append(resident)
                }
            } catch {
                // handle error
            }
        }
//        self.residents = residents
        self.likes = likes
        
        self.image = UIImage(named: "Eaw_Kamino")
        
        self.itemNames = ["Name", "Rotation period", "Orbital period", "Diameter", "Climate", "Gravity", "Terrain", "SurfaceWater", "Population", "Residents"]
        self.items = [name, rotationPeriod, orbitalPeriod, diameter, climate, gravity, terrain, surfaceWater, population, ""]
    }
    
    /// Returns the `Resident` object with the passed identifier.
    ///
    /// - Parameter identifier: The `Int` identifier of the resident.
    subscript(resident identifier: Int?) -> Resident? {
        guard let identifier = identifier else { return nil }
        return residents.filter { $0.identifier == identifier }.first
    }
}

extension Planet {
    /// Returns the number of planets items to display.
    ///
    /// - Returns: `Int` representing the number of items to display.
    func numberOfItems() -> Int {
        return items.count
    }
    
    /// Returns the cell at the given indexPath for the planet table view.
    ///
    /// - parameter tableView: A table view object requesting the cell.
    /// - parameter indexPath: An index path locating the item in the collection view.
    ///
    /// - returns: An object inheriting from `UITableViewCell` that the table view can use for the specified row.
    func cellForPlanetRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
        
        let isInteractable: Bool = itemNames[indexPath.row] == "Residents" ? true : false
        cell.configure(for: indexPath.row,title: itemNames[indexPath.row], explanation: items[indexPath.row], isInteractable: isInteractable)
        return cell
    }
    
    /// Returns the cell at the given indexPath for the population table view.
    ///
    /// - parameter tableView: A table view object requesting the cell.
    /// - parameter indexPath: An index path locating the item in the collection view.
    ///
    /// - returns: An object inheriting from `UITableViewCell` that the table view can use for the specified row.
    func cellForPopulationRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
        let resident = residents[indexPath.row]
        let residentInfo = "\(resident.height) cm, \(resident.mass) kg, \(resident.gender)"
        cell.configure(for: resident.identifier,title: resident.name, explanation: residentInfo, isInteractable: true)
        return cell
    }
}
