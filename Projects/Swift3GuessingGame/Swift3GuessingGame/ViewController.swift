//
//  ViewController.swift
//  Swift3GuessingGame
//
//  Created by carlynorama on 2016-08-22
//  License CC0 - No rights reserved.
//
//  Exercise for Udemy Class
//  https://www.udemy.com/complete-ios-10-developer-course/learn/v4/t/lecture/5449438?start=90

//  http://stackoverflow.com/questions/26288124/how-do-i-get-the-return-key-to-perform-the-same-action-as-a-button-press-in-swif
//  Builds on https://gist.github.com/carlynorama/b825426586706f0c85f1266008a90bc1

import UIKit

class ViewController: UIViewController {
    
    var numberOfFingers = Int()
    
    
    @IBOutlet var guessSubmissionField: UITextField!
    @IBOutlet var returnedMessageLabel: UILabel!
    
    @IBAction func submitGuessButton(_ sender: AnyObject) {
        guess()
    }
    
    @IBAction func guessTextFieldReturn(_ sender: AnyObject) {
        guess()
    }
    

    @IBAction func resetGameButton(_ sender: AnyObject) {
        setStage()
    }
    
    
    
    enum GuessError: Error {
        case Empty
        case NotInt
        case OutOfBounds
        case Wrong
    }
    
    
    func checkGuess(guessedNumberText: String?, generatedNumber: Int) throws -> String {
        print(generatedNumber)
        guard guessedNumberText != nil else {
            throw GuessError.Empty
        }
        guard guessedNumberText != "" else {
            throw GuessError.Empty
        }
        print("not empty")
        guard let guessedNumber = Int(guessedNumberText!) else {
            throw GuessError.NotInt
        }
        print("is an integer")
        guard case 0 ... 5 = guessedNumber else {
            throw GuessError.OutOfBounds
        }
        print("is in range")
        guard generatedNumber == guessedNumber else {
            throw GuessError.Wrong
        }
        print("isn't wrong")
        return "You Win!"
        
    }
    
    func submitGuess(myGuess: String?, setNumber: Int) -> String {
        let statusMessage: String?
        //Alternative fast approach: Convert int of generated number to string and just compare strings.
        //Nice and elegant. Whew.
        do {
            try statusMessage = checkGuess(guessedNumberText: myGuess, generatedNumber: setNumber)
        } catch GuessError.Empty {
            statusMessage = "You have to guess to play."
        } catch GuessError.NotInt {
            statusMessage = "\"\(myGuess!)\" is not a whole number between 0 and 5"
        } catch GuessError.OutOfBounds {
            statusMessage = "\"\(myGuess!)\" is a whole number, but it isn't between 0 and 5."
        } catch GuessError.Wrong {
            statusMessage = "Doh. Maybe next time."
        } catch {
            statusMessage = "Hunh. Something went wrong."
        }
        
        return statusMessage!  //was a UI update.
        //GuessButtonText.titleLabel!.text! = "Guess Again" //works for a second and then switches back to original label text.
        
        
    }
    
    func guess() {
        returnedMessageLabel.text = submitGuess(myGuess: guessSubmissionField.text, setNumber: numberOfFingers)
    }
    
    func newFingers() -> Int {
        //return Int(arc4random_uniform(5)+1)  //must have finger
        return Int(arc4random_uniform(6))
    }
    
    func setStage() {
        guessSubmissionField.text = nil
        returnedMessageLabel.text = nil
        srandomdev()
        //TIL: Int(arc4random()%6) has modulo bias.
        numberOfFingers = newFingers()
        print(numberOfFingers)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Whew made it")
        setStage()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

