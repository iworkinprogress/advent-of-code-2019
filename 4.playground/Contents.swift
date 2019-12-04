import UIKit

let start = 134792
let end = 675810

func numberDecreases(_ number: Int) -> Bool {
    let string = String(number)
    var previousCharacter = "0"
    for character in string {
        if Int(String(character))! < Int(previousCharacter)! {
            return true
        }
        previousCharacter = String(character)
    }
    return false
}

func numberHasMatchingPair(_ number: Int, _ repeatedDigitsRequired: Int) -> Bool {
    let string = String(number)
    var previousCharacter = "0"
    var charactersInRow = 1
    var totalCharactersInRow = 1
    for character in string {
        if Int(String(character)) == Int(previousCharacter) {
            charactersInRow += 1
        } else if(charactersInRow == repeatedDigitsRequired) {
            return true
        } else {
            charactersInRow = 1
        }
        totalCharactersInRow = max(totalCharactersInRow, charactersInRow)
        previousCharacter = String(character)
    }
    return totalCharactersInRow == repeatedDigitsRequired || charactersInRow == repeatedDigitsRequired
}

var matches = 0
var i = start
while i <= end {
    
    if(!numberDecreases(i) && numberHasMatchingPair(i, 2)) {
        matches += 1
    }
    
    i += 1
}

print(matches)
