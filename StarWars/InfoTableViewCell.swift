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
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var explanation: String = "" {
        didSet {
            explanationLabel.text = explanation
        }
    }
    var isInteractable: Bool = false {
        didSet {
            self.accessoryType = isInteractable ? .disclosureIndicator : .none
        }
    }
}

// MARK: - IntoTableViewCell configuration
extension InfoTableViewCell {
    /// Configures the cell with the given parameters.
    ///
    /// - Parameters:
    ///   - title: The cell title.
    ///   - explanation: The cell explanation
    ///   - isInteractable: `true` if the cell is interactable, `false` otherwise.
    func configure(title: String, explanation: String, isInteractable: Bool) {
        self.title = title
        self.explanation = explanation
        self.isInteractable = isInteractable
    }
}
