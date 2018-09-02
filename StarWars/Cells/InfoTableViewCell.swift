//
//  InfoTableViewCell.swift
//  StarWars
//
//  Created by Tomaz Golob on 01/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    /// The label for the title text of the cell.
    @IBOutlet weak var titleLabel: UILabel!
    /// The label for the explanation text of the cell.
    @IBOutlet weak var explanationLabel: UILabel!
    
    /// The title of the cell.
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    /// The explanation of the cell.
    var explanation: String = "" {
        didSet {
            explanationLabel.text = explanation
        }
    }
    /// `true` if the cell is interactable and the disclosure indicator should be shown, `false` otherwise.
    var isInteractable: Bool = false {
        didSet {
            self.accessoryType = isInteractable ? .disclosureIndicator : .none
        }
    }
    /// The identifier of the object used for cell creation.
    var identifier: String = "-1"
}

// MARK: - IntoTableViewCell configuration
extension InfoTableViewCell {
    /// Configures the cell with the given parameters.
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the object used for cell creation.
    ///   - title: The cell title.
    ///   - explanation: The cell explanation
    ///   - isInteractable: `true` if the cell is interactable, `false` otherwise.
    func configure(for identifier: String, title: String, explanation: String, isInteractable: Bool) {
        self.identifier = identifier
        self.title = title
        self.explanation = explanation
        self.isInteractable = isInteractable
    }
}
