//
//  ViewController.swift
//  2020-03-16-FoodImageLoop-Ping-Zhao
//
//  Created by Ping Zhao on 3/16/20.
//  Copyright © 2020 Ping Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    let foodImageArray = ["chicken", "hamburger", "noodle", "pasta", "pizza", "salad", "steak"]
    
    let foodNameArray = ["Roasted Chicken", "Classic Burger", "Chicken Noodle Soup", "Bow-Tie Pasta", "Pepperoni Pizza", "Italian Salad", "Grilled Steak"]
    
    let foodPriceArray = [13.99, 13.99, 11.99, 12.99, 11.99, 10.99, 15.99]
    
    var foodIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodImageView.image = UIImage(named: foodImageArray[0])
        
        foodPriceLabel.text = foodNameArray[0] + ": $" + "\(foodPriceArray[0])"
    }


    @IBAction func nextDishButtonClicked(_ sender: UIButton) {
        foodIndex += 1
        if foodIndex == foodImageArray.count {
            foodIndex = 0
        }
        foodImageView.image = UIImage(named: foodImageArray[foodIndex])
        foodPriceLabel.text = foodNameArray[foodIndex] + ": $" + "\(foodPriceArray[foodIndex])"
        
        
    }
}

