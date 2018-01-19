//
//  ViewController.swift
//  BullsEye
//
//  Created by ehson on 1/17/18.
//  Copyright © 2018 ehson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //sliders default value in the game is 50.
    var userSlider: Int = 50
    //default value can by anything as it can only roll from 1 to 100
    var bullsEye: Int = 1
    
    //associated with var bullsEye
    @IBOutlet weak var winNumber: UILabel!
    
    //associated with var userSlider
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //slider is a double type, we take its' value converted into Int type
        userSlider = Int(slider.value)
    }
  
    //method that rolls a new random bullsEye number
    @IBAction func playAgain(_ sender: UIButton) {
        updateBullsEye()
        /**
         converting an int to String and storing into winNumber.text,  as winNumber itself must add the '.text' to accept String.
        */
        winNumber.text = String(bullsEye)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // When user presses 'Hit Me!' we should display game status.
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Results:", message: "Your gestured guess number: \(userSlider)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Touch 'Play Again?' to reset Bull's Eye target", style: .default,handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // method when user moves slider, changes slider value
    @IBAction func sliderMoved(_ slider: UISlider) {
        userSlider = Int(slider.value)
        
    }
    //from eightball app, roll random # from 1 - 100
    func updateBullsEye(){
         bullsEye = 1 + Int(arc4random_uniform(100))
    }
    
}

