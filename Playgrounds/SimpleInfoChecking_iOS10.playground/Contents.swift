//Array, Dictionary Scratch Pad, Swift Xcode 8 Beta 6
//2016. 08
//carlynorama, license: CC0

//https://www.udemy.com/complete-ios-10-developer-course/
//https://developer.apple.com/reference/swift/dictionary
//https://www.hackingwithswift.com/new-syntax-swift-2-error-handling-try-catch

import UIKit


let stringVar:String? = nil
stringVar ?? "a default string"  // if string var is not nill return stringVar, else return default

enum UserProfileError: Error {
    case UserNotFound
    case BadPass
    case NietherSupplied
    case OneNotSupplied
}


//SCOPE!!! These must be outside do to be used also by the catches.
let enteredUser = "GeorgeJettson"
let enteredPassword = "partparty"

func checkUser(user: String, withPassword password: String) throws -> String {
    
    guard !password.isEmpty && !user.isEmpty else { throw UserProfileError.NietherSupplied }
    guard !password.isEmpty || !user.isEmpty else { throw UserProfileError.OneNotSupplied }
    
    var userVerified = Bool()
    var passwordVerified = Bool()
    
    if user == "GeorgeJettson" {  userVerified = true; } else { userVerified = false }
    //if password == "partyparty" { passwordVerified = true } else { passwordVerified = false }
    
    //a >= 0 ? doThis(): doThat()
    password == "partyparty" ? (passwordVerified = true) : (passwordVerified = false)
    

    guard userVerified else { throw UserProfileError.UserNotFound }
    guard passwordVerified else { throw UserProfileError.BadPass }
    
    //let welcomeMessage =
    return  "Welcome \(enteredUser). Please enjoy the show."}



do {
    defer { print("Shutting the door.") }
    let verificationMessage = try checkUser(user: enteredUser, withPassword: enteredPassword)
    print(verificationMessage)
    //other stuff
} catch UserProfileError.UserNotFound {
    print("I don't recognize you.")
} catch UserProfileError.BadPass {
    let message = String(format: "I'm sorry %@ that password was not correct", enteredUser)
    print(message)
} catch UserProfileError.NietherSupplied {
    print("I'm sorry I didn't hear anything")
} catch UserProfileError.OneNotSupplied {
    print("I'm sorry, could you make sure you entered BOTH a username and password?")
} catch {
    print("Something went wrong!")
}
