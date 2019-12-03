import UIKit

let originalCodes: [Int] = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,19,9,23,1,5,23,27,1,27,9,31,1,6,31,35,2,35,9,39,1,39,6,43,2,9,43,47,1,47,6,51,2,51,9,55,1,5,55,59,2,59,6,63,1,9,63,67,1,67,10,71,1,71,13,75,2,13,75,79,1,6,79,83,2,9,83,87,1,87,6,91,2,10,91,95,2,13,95,99,1,9,99,103,1,5,103,107,2,9,107,111,1,111,5,115,1,115,5,119,1,10,119,123,1,13,123,127,1,2,127,131,1,131,13,0,99,2,14,0,0];

var codes: [Int] = originalCodes;

func add(at index: Int) {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let output = codes[index+3];
    codes[output] = codes[inputA] + codes[inputB];
}

func multiply(at index: Int) {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let output = codes[index+3];
    codes[output] = codes[inputA] * codes[inputB];
}

func calculate(at index: Int) -> Bool {
    let code = codes[index];
    if(code == 1) {
        add(at: index);
    } else if(code == 2) {
        multiply(at: index);
    } else if(code == 99) {
        return false;
    }
    return true;
}

func run() {
    var i = 0;
    var shouldContinue = true;
    while i < codes.count && shouldContinue {
        shouldContinue = calculate(at: i);
        i += 4;
    }
}

func restoreProgramAlarm(_ noun: Int, _ verb: Int) {
    codes[1] = noun;
    codes[2] = verb;
}

var noun = 0;
var verb = 0;
while(verb <= 99) {
    codes = originalCodes;
    restoreProgramAlarm(noun, verb);
    run();
    if(codes[0] == 19690720) {
        print(noun, verb);
        break;
    }
    noun += 1;
    if(noun > 99) {
        noun = 0;
        verb += 1;
    }
}
