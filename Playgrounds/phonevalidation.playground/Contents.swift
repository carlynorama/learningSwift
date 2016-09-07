//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let string = "123 Main St. / (555) 555-5555"
let types: NSTextCheckingResult.CheckingType = [.address, .phoneNumber]
let detector = try? NSDataDetector(types: types.rawValue)
detector?.enumerateMatches(in: string, options: [], range: NSMakeRange(0, (string as NSString).length)) { (result, flags, _) in
    print(result)
}

let input = "This is a test with the URL https://www.hackingwithswift.com to be detected."
let detector2 = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
let matches = detector2.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))

for match in matches {
    let url = (input as NSString).substring(with: match.range)
    print(url)
}

let myphoneString = "555.555.5555 fhisreiof;asjdg;ga"

let myphoneString2 = "99452"
let detector3 = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
let matches2 = detector3.matches(in: myphoneString, options: [], range: NSRange(location: 0, length: myphoneString.utf16.count))

for match in matches2 {
    let number = (myphoneString as NSString).substring(with: match.range)
    print(number)
}

func validate(value: String) -> Bool {
    let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: value)
    return result
}


func getPhoneNumber(stringToCheck:String) -> String {
    let myDetector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
    let possibleNumbers = myDetector.matches(in: stringToCheck, options: [], range: NSRange(location: 0, length: stringToCheck.utf16.count))

    guard possibleNumbers.count == 1 else {
        return("Not a single phone number")
    }
    
    let phoneNumber = (stringToCheck as NSString).substring(with:possibleNumbers[0].range)
    return phoneNumber
}




getPhoneNumber(stringToCheck: myphoneString2)
