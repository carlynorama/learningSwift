//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let string = "123 Main St. / (555) 555-5555"
//let types: NSTextCheckingResult.CheckingType = [.address, .phoneNumber]
//let detector = try? NSDataDetector(types: types.rawValue)
//detector?.enumerateMatches(in: string, options: [], range: NSMakeRange(0, (string as NSString).length)) { (result, flags, _) in
//    print(result)
//}


//let input = "This is a test with the URL https://www.hackingwithswift.com to be detected."
//let detector2 = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
//let matches = detector2.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
//
//for match in matches {
//    let url = (input as NSString).substring(with: match.range)
//    print(url)
//}

//let dateString = "I was going to go on 12/04/2016"
let dateString = "I was going to go Sun, 20 Nov 2016 14:35:00 -0800"
let types: NSTextCheckingResult.CheckingType = [.date]
let detector = try! NSDataDetector(types: types.rawValue)
let date_matches = detector.matches(in: dateString, options: [], range: NSMakeRange(0, (dateString as NSString).length))

for match in date_matches {
    let date = (dateString as NSString).substring(with: match.range)
    print(date)
}


