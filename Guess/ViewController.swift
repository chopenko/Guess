//
//  ViewController.swift
//  Guess
//
//  Created by Eugene Chopenko on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("loadView")
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "V.1.1"
        self.view.addSubview(versionLabel)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = "Your goal: " + String(self.number)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    var number: Int = Int.random(in: 1...50)
    var round: Int = 1
    var points: Int = 0
    
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBAction func checkNumber() {
        
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
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        self.label.text = "Your goal: " + String(self.number)
    }
    @IBAction func showNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        // let viewController = SecondViewController()
        self.present(viewController, animated: true, completion: nil)
    }
    

}

