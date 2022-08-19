//
//  ViewController.swift
//  Guess
//
//  Created by Eugene Chopenko on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var number: Int = Int.random(in: 1...50)
    var round: Int = 0
    var points: Int = 0
    
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBAction func checkNumber() {
        self.label.text = "Your goal: " + String(self.number)
//        if self.round == 0 {
            // self.number = Int.random(in: 1...50) // NUM
            // self.label.text = "Your goal: " + String(self.number)
//            self.round = 1
//        } else {
        
        // taking user's variant
        let numSlider = Int(self.slider.value.rounded())
        
        if numSlider > self.number {
                self.points += 50 - numSlider + self.number
                self.label.text = "Your goal: " + String(self.number) + " (<<<)"
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
            self.label.text = "Your goal: " + String(self.number) + " (>>>)"
        } else {
            self.points += 50
            self.label.text = "Your goal: " + String(self.number) + " (!!!)"
        }
        
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Game Over",
                message: "You have earned \(self.points) points",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Start over", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
            self.number = Int.random(in: 1...50)
            // self.label.text = "Your goal: " + String(self.number)
        } else {
            self.round += 1
        }
    }
    
    

}

