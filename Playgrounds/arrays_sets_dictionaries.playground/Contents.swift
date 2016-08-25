//Array, Dictionary Scratch Pad, Swift Xcode 8 Beta 6
//2016. 08
//carlynorama, license: CC0

// Some from Rob Percival's iOS 10 on Udemy, some from swift docs and previous swift 2.1 work

//https://www.udemy.com/complete-ios-10-developer-course/
//https://developer.apple.com/reference/swift/dictionary

import UIKit

//----------------------------------------------- INT AND DOUBLE ARRAYS

//challenge array 3.87, 7.1.8.9, remove 7.1, Append 3.87 * 8.9

var array = [3.87, 7.1, 8.9]
array.remove(at: 1)
array.append(array[0] * array[1])
array.append(2)
array.reverse()
array.count
array.sort()

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items.")
someInts = []
print("someInts is of type [Int] with \(someInts.count) items.")

var threeDoubles = [Double](repeating: 0.0, count: 3)
var anotherThreeDoubles = [Double](repeating: 2.5, count: 3)
var comboArray = threeDoubles + anotherThreeDoubles

//------------------------------------------------------- STRINGS ARRAYS

var shoppingList: [String] = ["Eggs", "Milk"]
var secondList  = [String]()

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

if secondList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList += ["Baking Powder"]
shoppingList += ["chocolate","flour"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 2)
let apples = shoppingList.removeLast()

//----------------------------------------------------- BASIC DICTIONARY
//https://developer.apple.com/reference/swift/dictionary

var menu = [String: Double]() //or float, or decimal?
menu["Pizza"] = 10.99
menu["Ice Cream"] = 4.99
menu["Salad"] = 7.99
menu["Soda"] = 1.79
menu["Iced Tea"] = 1.79
print(menu)
menu.updateValue(1.99, forKey: "Soda")
print(menu)
menu["Iced Tea"] = nil
menu.removeValue(forKey: "Soda")
print(menu)

let item1 = "Pizza"  //does not need to the forced syntax let item1:String
print("The total cost of my meal is \(menu[item1]! + menu["Ice Cream"]!)")

// -------------------------------------------------------- REDUCE
var str = "Hello, playground"
//Concat strings
print(["one","two","three"].reduce("This string comes before: ",{$0 + $1}))

//Sum an Int array
let numbers = [Int](0..<10)
let total = numbers.reduce(0, +)
//same as  numbers.reduce(0, combine: {$0 + $1})


//Dictionary values
let myMenu = [
    "french fries"  : 1.25,
    "veggie burger" : 5.95,
    "Soda"          : 1.65  //btw, CAPS come before lower case in alpha sorts
]

print("The cost of your meal is \(myMenu.values.reduce(0, +))")
print("Actually, I'm charging you 3.65 extra, so \(myMenu.values.reduce(3.65, +))")

// -------------------------------------------------------------- SORTING

// -------------------------------------------------------------- SORTING

var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 15],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
for key in interestingNumbers.keys {
    //sort not sorted here b/c acting on the array in the value
    interestingNumbers[key]?.sort(by: >)
}

print(interestingNumbers["primes"]!)
// Prints "[15, 13, 11, 7, 5, 3, 2]"

//Default sorting is by KEY
let sortedDict = myMenu.sorted(by: >)
print("\(sortedDict)")


//assume that sort() kinda takes 2 arguments i.e. sort(dictionary element a, dictionary element b)
//woriking its way down the array (http://www.sorting-algorithms.com/bubble-sort)
//compare the 0th assumed parameter(a) with the 1st assumed parameter (b), using the key (0 after decimal)
// < acending, > decending, case sensitive
//rise repeat.


let myDictionary = [
    "20" : "banna",
    "60" : "apple",
    "30" : "cucumber",
    "10" : "starfruit"
]

//explicit sorting by key
let sortedByKeyDictionary = myDictionary.sorted { $0.0 < $1.0 }
print("\(sortedByKeyDictionary)")

//compare the 0th (a) with the 1st (b), using the value (1 after decimal)
//rinse repeat.
let sortedByValueDictionary = myDictionary.sorted { $0.1 < $1.1 }
print("\(sortedByValueDictionary)")