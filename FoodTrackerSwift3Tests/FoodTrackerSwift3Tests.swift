//
//  FoodTrackerSwift3Tests.swift
//  FoodTrackerSwift3Tests
//
//  Created by Salis on 9/20/16.
//  Copyright © 2016 Salis. All rights reserved.
//

import XCTest
import UIKit
@testable import FoodTrackerSwift3

class FoodTrackerSwift3Tests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Test to confirm that the Meal initializer returns when no name or a negative rating
    func testMealInitialization() {
        // success cases
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName)
        
        let badRating = Meal(name: "Really bad", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
}
