//
//  Pop.swift
//  StarWars
//
//  Created by Tomaz Golob on 01/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class Pop {
    
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    
    let homeworld: Planet?
    var image: UIImage?
    
    /// Initializes a new result question object from a JSON object.
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
    }
}
