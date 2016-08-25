//
//  primenumberchecker.swift
//  Prime Number Checker iOS10
//
//  Created by Carlyn Maw on 8/25/16.
//  No rights reserved.
//

import Foundation


//I seem to need function to get the case statement function matching to work.
//I don't know why yet.
//To read: http://oleb.net/blog/2015/09/swift-pattern-matching/
//To read 2016: https://www.raywenderlich.com/134844/pattern-matching-in-swift
func ~=<T>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}

func isEven(n: Int) -> Bool { return n % 2 == 0 }
func isDivisableByThree(n: Int) -> Bool { return n % 3 == 0 }
func isDivisableByFive(n: Int) -> Bool { return n % 5 == 0 } //debated effiency
func sixKplus1(n: Int) -> Bool { return (n-1) % 6 == 0 }
func sixKminus1(n: Int) -> Bool { return (n+1) % 6 == 0 }

//assume already checked the easy ones
func possiblePrimeFactorsOver3(n: Int) -> Array<Int> {
    var intArray: [Int] = Array(0...Int(sqrt(Double(n))))
    for (i, _) in intArray.enumerated().reversed(){
        switch intArray[i]{
        case Int.min..<3:
            intArray.remove(at: i)
        case isEven, isDivisableByThree, isDivisableByFive:
            intArray.remove(at: i)
        case sixKminus1, sixKplus1:
            continue
        default:
            intArray.remove(at: i)
        }
    }
    //print(intArray)
    return intArray
}

func hasFactors(n: Int) -> Bool {
    let checkThese = possiblePrimeFactorsOver3(n: n)
    for (i, _) in checkThese.enumerated() {
        if n % checkThese[i] != 0 {
            continue
        } else {
            return true
        }
    }
    return false
}

//would this be better as gaurds? 
func isPrime(checkMe: Int) ->Bool {
    
    switch checkMe {
    case Int.min..<1:
        print("1 or smaller")
        return false
    case 2,3:
        print("\(checkMe) is 2 or 3")
        return true
    case _ where checkMe%2 == 0:
        print("\(checkMe) is divisible by 2")
        return false
    case _ where isDivisableByThree(n: checkMe):
        print("\(checkMe) divisible by 3")
        return false
    case let x where isDivisableByFive(n: x):  //Debatably efficient.
        print("\(x) divisible by 5")
        return false
    case let x where x%7 == 0:  //Definately not effiecent, in here for syntax lesson
        print("\(x) is divisible by 7")
        return false
    case _ where hasFactors(n: checkMe):
        print("long factors check")
        return false
    default:
        print("defaulted out")
        return true
    }
    
}







