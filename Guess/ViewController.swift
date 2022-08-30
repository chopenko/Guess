//
//  ViewController.swift
//  Guess
//
//  Created by Eugene Chopenko on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
//    @IBAction func checkNumber() {
    

// MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // creating game entity
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        // updating label
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }

    
    // interaction View-Model:
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
                 
    
    // MARK: update View:
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
        
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Game Over",
            message: "You have earned \(score) points",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Start over", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    

}

