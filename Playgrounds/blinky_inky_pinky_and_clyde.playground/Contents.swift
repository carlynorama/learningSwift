// Created by carlynorama on 2016-08-22
// License CC0 - No rights reserved.
// Modified from https://www.udemy.com/complete-ios-10-developer-course/learn/v4/t/lecture/5449162


import UIKit

class Ghost {
    
    var isAlive = true
    var strength:Int = 9
    var color = "grey"
    
    init() {}
    
    init(color: String, strength: Int) {
        self.color   = color
        self.strength = strength
    }

    
    func kill() {
        isAlive = false
    }
    
    func isStrong() -> Bool {
        if strength > 10 {
            return true
        } else {
            return false
        }
    }
    
}

//This doesn't work... not even a little bit
let ghostNames = ["blinky", "inky", "pinky", "clyde"]
let ghostColors = ["red", "blue", "pink", "orange"]
let ghostStrengths = [7, 8, 9, 10]

var ghostCollection = [Ghost]()

for (index, ghostname) in ghostNames.enumerated() {
    var newGhost = Ghost(color: ghostColors[index], strength: ghostStrengths[index])  // <-superbad trying to use a string as a variable name like this
//    newGhost.color = ghostColors[index]        //if don't make custom init
//    newGhost.strength = ghostStrengths[index]  //if don't make custom init
    ghostCollection.append(newGhost)
    
}

var blinky = ghostCollection[0]
var inky = ghostCollection[1]
var pinky = ghostCollection[2]
var clyde = ghostCollection[3]
var ghostInTheMachine = Ghost()

print(blinky.isAlive)
ghostCollection[0].kill()
print(blinky.isAlive)

print (inky.isStrong())
inky.strength = 20
print(inky.strength)
print(inky.isStrong())

clyde.kill()
print(clyde.isAlive)

print(ghostInTheMachine.color)




