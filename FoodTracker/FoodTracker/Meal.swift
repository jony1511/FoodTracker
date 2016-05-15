//
//  Meal.swift
//  FoodTracker
//
//  Created by HF on 5/14/16.
//  Copyright © 2016 HF. All rights reserved.
//

import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int){
        if name.isEmpty || rating<0{
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
