//
//  ViewController.swift
//  guessTheFlag
//
//  Created by TALHA AYAR on 4.08.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    var score = 0
    var correctAnswerNumber = 0
    var countries = ["brazil","spain","japan","korea","china","germany","usa","uk"]
    override func viewDidLoad() {
        super.viewDidLoad()
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswerNumber = Int.random(in: 0...2)
        title = countries[correctAnswerNumber].uppercased()
        firstButton.imageView?.image = UIImage(named: countries[0])
        firstButton.setImage(UIImage(named: countries[0]), for: .normal)
        secondButton.setImage(UIImage(named: countries[1]), for: .normal)
        thirdButton.setImage(UIImage(named: countries[2]), for: .normal)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title = ""
        if sender.tag == correctAnswerNumber {
            score += 1
            title = "Success"
        } else {
            score -= 1
            title = "Wrong"
        }
       let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true, completion: nil)
    }
    
}

