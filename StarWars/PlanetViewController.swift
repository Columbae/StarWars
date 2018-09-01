//
//  ViewController.swift
//  StarWars
//
//  Created by Tomaz Golob on 01/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            // TODO :: register all of the cells needed in the collectionView
//            collectionView.register(TextCollectionViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

