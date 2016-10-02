//: Playground - noun: a place where people can play

import UIKit


//Charles E in Q&A
var playground = "Hello, playground!"
let fromStart = playground.startIndex
let index = playground.index(playground.startIndex, offsetBy: 4)
playground[index]
let range = fromStart...index
let firstFive = playground[range]

//more to read: http://www.swift-studies.com/blog/2016/6/17/swift-30-string-index-changes
// http://stackoverflow.com/questions/28182441/swift-how-to-get-substring-from-start-to-last-index-of-character
// http://stackoverflow.com/questions/38159687/array-remove-object-at-string-may-not-be-indexed-with-int-it-has-variable


let string = "ABCDEFG"
if let range = string.range(of: "CDEF") {
    let lo = string.index(range.lowerBound, offsetBy: 1)
    let hi = string.index(range.lowerBound, offsetBy: 3)
    let subRange = lo ..< hi
    print(string[subRange]) // "DE"
}

if let newrange = playground.range(of: "play") {
    let lo = playground.index(newrange.lowerBound, offsetBy: 1) //for clipping
    let hi = playground.index(newrange.upperBound, offsetBy: 1) //for clipping

    let subRange = lo ..< hi
    print(playground[subRange])
}

if let newrange2 = playground.range(of: "play") {
    print(playground[newrange2])
}

//Rob's way
let myString = "Howdy Partner"
let newString = NSString(string: myString)
newString.substring(to: 5)
newString.substring(from: 4)




