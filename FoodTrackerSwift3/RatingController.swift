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
    var rating = 0
    var ratingButtons = [UIButton]()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<5 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.red
            // add action button
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchDown)
            // adding it to array instance variable
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    // MARK: Initialization
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // offset each button's origin by length of the button plus spacing
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (44 + 5))
            button.frame = buttonFrame
        }
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

}
