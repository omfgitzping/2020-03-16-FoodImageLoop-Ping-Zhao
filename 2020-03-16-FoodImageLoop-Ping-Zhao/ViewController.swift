//
//  ViewController.swift
//  2020-03-16-FoodImageLoop-Ping-Zhao
//
//  Created by Ping Zhao on 3/16/20.
//  Copyright © 2020 Ping Zhao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    let foodImageArray = ["chicken", "hamburger", "noodle", "pasta", "pizza", "salad", "steak"]
    
    let foodNameArray = ["Roasted Chicken", "Classic Burger", "Chicken Noodle Soup", "Bow-Tie Pasta", "Pepperoni Pizza", "Italian Salad", "Grilled Steak"]
    
    let foodPriceArray = [13.99, 13.99, 11.99, 12.99, 11.99, 10.99, 15.99]
    
    let soundArray = ["applause02", "cheering01", "cheering02", "gong", "guitar", "magic", "movie"]
    
    var foodIndex = 0
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodImageView.image = UIImage(named: foodImageArray[0])
        
        foodPriceLabel.text = foodNameArray[0] + ": $" + "\(foodPriceArray[0])"
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
                do {
                    try audioPlayer = AVAudioPlayer(data: sound.data)
                    audioPlayer.play()
                } catch {
                    print("ERROR: \(error.localizedDescription) Could not initialize AVAudio")
            }
        } else {
            print("ERROR: Could not read data from file sound0")
        }
    }


    @IBAction func nextDishButtonClicked(_ sender: UIButton) {
        foodIndex += 1
        if foodIndex == foodImageArray.count {
            foodIndex = 0
        }
        foodImageView.image = UIImage(named: foodImageArray[foodIndex])
        foodPriceLabel.text = foodNameArray[foodIndex] + ": $" + "\(foodPriceArray[foodIndex])"
        
        if playSoundSwitch.isOn {
        playSound(name: soundArray[foodIndex])
        }
    }
    
    @IBAction func playSoundToggle(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil{
                audioPlayer.stop()
            }
    }
}

