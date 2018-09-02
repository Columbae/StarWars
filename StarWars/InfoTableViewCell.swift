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
    /// A content delegate object.
//    weak var delegate: ContentDelegate?
//
//    /// Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        backgroundView = UIView()
//        backgroundView?.backgroundColor = .white
//        guard let tintColor = UIApplication.shared.delegate?.window??.tintColor else { return }
//        selectedBackgroundView = UIView()
//        selectedBackgroundView?.backgroundColor = tintColor.withAlphaComponent(0.10)
//    }
}

// MARK: - ActionQuestion configuration
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
    
//    /// Returns the size for the cell presenting a particular question.
//    ///
//    /// - Parameters:
//    ///   - question: The question that is displayed in the cell.
//    ///   - collectionView: The collection view displaying the cell.
//    /// - Returns: A `CGSize` object representing the cell size.
//    static func size(for question: ActionQuestion, in collectionView: UICollectionView) -> CGSize {
//        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
//        // Horizontally, we need to first check for insets on the collection view layout level, and then add the internal constraints.
//        var cellHeight: CGFloat = 0
//        let cellWidth = collectionView.frame.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right
//        let contentWidthConstraint = cellWidth - C.ContentInsets.left - C.HorizontalSpacing - C.ActionImageWidth - C.ContentInsets.right
//
//        // Top inset
//        cellHeight += C.ContentInsets.top
//        // Main label
//        cellHeight += question.title.attributedString(with: C.TitleLabelFont).height(constrainedBy: contentWidthConstraint)
//        // Explanation label
//        if let explanation = question.explanation {
//            cellHeight += C.VerticalSpacing // Spacing b/w elements
//            cellHeight += explanation.height(constrainedBy: contentWidthConstraint, with: C.ExplanationLabelFont)
//        }
//        // Bottom inset
//        cellHeight += C.ContentInsets.bottom
//
//        return CGSize(width: cellWidth, height: max(cellHeight, 53))
//    }
}
