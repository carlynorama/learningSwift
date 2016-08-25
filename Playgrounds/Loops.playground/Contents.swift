//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var i = 0

while i <= 20 {
    print (i*7)
    i += 1
}

print ("__________")

i = 7
while i <= 140 {
    print (i)
    i += 7
}

var array = [7, 23, 45, 6 ,98, 10, 768]

i = 0
while i < array.count {
  array[i] = array[i] + 1
  i += 1
}

print(array)

//better way
for number in array {
    print(number)
}

let bandNames = ["bob", "linda", "diane"]

for musician in bandNames {
    print("Jam on \(musician)")
}

for (joinOrder, musicianName) in bandNames.enumerated() {
    print("Jam on \(musicianName), you were the number \(joinOrder + 1) person to join the band")
}

//var bigNumbers = [Double]()
var bigNumbers: [Double] = [8, 7, 19, 28]

for (index, value) in bigNumbers.enumerated() {
    bigNumbers[index] = value*0.5
}

print(bigNumbers)
