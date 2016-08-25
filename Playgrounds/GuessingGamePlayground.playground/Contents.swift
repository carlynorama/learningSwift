//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var numberOfFingers = arc4random()%6

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


func submitGuess(myGuess: String?, setNumber: Int) throws -> String {
    let statusMessage: String?
    //Alternative approach: Convert int of generated number to string and just compare strings.
    //Nice and elegant. Whew.
    do {
        try statusMessage = checkGuess(guessedNumberText: myGuess, generatedNumber: setNumber)
    } catch GuessError.Empty {
        statusMessage = "You have to guess to play."
    } catch GuessError.NotInt {
        statusMessage = "That's not a whole number between 0 and 5"
    } catch GuessError.OutOfBounds {
        statusMessage = "That's a whole number, but it isn't between 0 and 5."
    } catch GuessError.Wrong {
        statusMessage = "Doh. Maybe next time."
    } catch {
        statusMessage = "Hunh. Something went wrong."
    }
    
    return statusMessage!  //was a UI update.
    //GuessButtonText.titleLabel!.text! = "Guess Again" //works for a second and then switches back to original label text.
    
    
}

func reset() {
    //messageField.text = ""
    //myGuessTextFieldOutlet.text = nil
    srandomdev()
    numberOfFingers = arc4random()%6
    print(numberOfFingers)
}

/*
override func viewDidLoad() {
    super.viewDidLoad()
    srandomdev()
    numberOfFingers = random()%6
    print("launched")
    // Do any additional setup after loading the view, typically from a nib.
    
}
 */

