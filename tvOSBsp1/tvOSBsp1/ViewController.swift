//
//  ViewController.swift
//  tvOSBsp1
//
//  Created by Christian Bleske on 06.12.15.
//  Copyright © 2015 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberToGuess = 0
    var inputNumber = 0
    var tryCounter = 0
    
    @IBOutlet var currentNumber: UILabel!
    @IBOutlet var hintNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNumberToGuess()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increaseNumber(_ sender: AnyObject) {
        inputNumber += 1
        currentNumber.text = String(inputNumber)
    }

    @IBAction func decreaseNumber(_ sender: AnyObject) {
        inputNumber -= 1
        currentNumber.text = String(inputNumber)
    }
    
    @IBAction func guessNumber(_ sender: AnyObject) {
        startGuessing()
    }
    
    func initNumberToGuess() {
        numberToGuess = getRandomNumber(0, max: 60)
    }
    
    func getRandomNumber(_ min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func startGuessing() {
        if (inputNumber > numberToGuess) {
            tryCounter += 1
            hintNumber.text = "Zahl zu groß!"
        }
        if (inputNumber < numberToGuess) {
            tryCounter += 1
            hintNumber.text = "Zahl zu klein!"
        }
        if (inputNumber == numberToGuess) {
            tryCounter += 1;
            hintNumber.text = "Richtig geraten!";
            //showDialogWithTitle()
            showAlertViewWithTitle("Zahl gefunden!!",
                message:"Sie haben \(tryCounter) Versuche benötigt. Neue Zahl wird generiert.")
            tryCounter = 0;
            initNumberToGuess()
        }
    }
    
    func showAlertViewWithTitle(_ title:String, message:String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // ...
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
        
    }
    
}

