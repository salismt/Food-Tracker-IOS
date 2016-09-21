//
//  Meal.swift
//  FoodTrackerSwift3
//
//  Created by Salis on 9/21/16.
//  Copyright © 2016 Salis. All rights reserved.
//
import UIKit

class Meal {
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}
