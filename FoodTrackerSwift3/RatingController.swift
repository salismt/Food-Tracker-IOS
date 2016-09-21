//
//  RatingController.swift
//  FoodTrackerSwift3
//
//  Created by Salis on 9/21/16.
//  Copyright © 2016 Salis. All rights reserved.
//

import UIKit

class RatingController: UIView {
    
    // MARK: Properties
    var rating = 0 {
        didSet { // this is called :property observer:
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filled_stars")
        let emptyStarImage = UIImage(named: "empty_stars")
        
        for _ in 0..<starCount {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.adjustsImageWhenHighlighted = false
            
            // add action button
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchDown)
            
            // set image state
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            
            // adding it to array instance variable
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    // MARK: Initialization
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
    
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // offset each button's origin by length of the button plus spacing
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // if index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
    }
    
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
        updateButtonSelectionStates()
    }

}
