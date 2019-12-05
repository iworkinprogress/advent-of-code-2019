import UIKit

var codes: [Int] = [3,225,1,225,6,6,1100,1,238,225,104,0,1101,69,55,225,1001,144,76,224,101,-139,224,224,4,224,1002,223,8,223,1001,224,3,224,1,223,224,223,1102,60,49,225,1102,51,78,225,1101,82,33,224,1001,224,-115,224,4,224,1002,223,8,223,1001,224,3,224,1,224,223,223,1102,69,5,225,2,39,13,224,1001,224,-4140,224,4,224,102,8,223,223,101,2,224,224,1,224,223,223,101,42,44,224,101,-120,224,224,4,224,102,8,223,223,101,3,224,224,1,223,224,223,1102,68,49,224,101,-3332,224,224,4,224,1002,223,8,223,1001,224,4,224,1,224,223,223,1101,50,27,225,1102,5,63,225,1002,139,75,224,1001,224,-3750,224,4,224,1002,223,8,223,1001,224,3,224,1,223,224,223,102,79,213,224,1001,224,-2844,224,4,224,102,8,223,223,1001,224,4,224,1,223,224,223,1,217,69,224,1001,224,-95,224,4,224,102,8,223,223,1001,224,5,224,1,223,224,223,1102,36,37,225,1101,26,16,225,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,1107,677,677,224,102,2,223,223,1006,224,329,1001,223,1,223,1108,677,677,224,1002,223,2,223,1006,224,344,1001,223,1,223,107,226,226,224,1002,223,2,223,1006,224,359,101,1,223,223,1008,226,226,224,102,2,223,223,1005,224,374,1001,223,1,223,1107,226,677,224,1002,223,2,223,1006,224,389,1001,223,1,223,1008,677,226,224,1002,223,2,223,1005,224,404,1001,223,1,223,7,677,226,224,102,2,223,223,1005,224,419,1001,223,1,223,1008,677,677,224,1002,223,2,223,1006,224,434,1001,223,1,223,108,226,226,224,102,2,223,223,1006,224,449,1001,223,1,223,108,677,677,224,102,2,223,223,1006,224,464,1001,223,1,223,107,226,677,224,1002,223,2,223,1005,224,479,101,1,223,223,1108,226,677,224,1002,223,2,223,1006,224,494,1001,223,1,223,107,677,677,224,1002,223,2,223,1006,224,509,101,1,223,223,7,677,677,224,102,2,223,223,1006,224,524,1001,223,1,223,1007,226,677,224,1002,223,2,223,1005,224,539,1001,223,1,223,8,226,677,224,1002,223,2,223,1005,224,554,101,1,223,223,8,677,677,224,102,2,223,223,1005,224,569,101,1,223,223,7,226,677,224,102,2,223,223,1006,224,584,1001,223,1,223,1007,226,226,224,102,2,223,223,1006,224,599,1001,223,1,223,1107,677,226,224,1002,223,2,223,1006,224,614,1001,223,1,223,1108,677,226,224,1002,223,2,223,1005,224,629,1001,223,1,223,1007,677,677,224,102,2,223,223,1006,224,644,1001,223,1,223,108,226,677,224,102,2,223,223,1005,224,659,101,1,223,223,8,677,226,224,1002,223,2,223,1006,224,674,1001,223,1,223,4,223,99,226];

let input = 5;

func add(at index: Int, _ mode1: Int, _ mode2: Int, _ mode3: Int) {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let output = codes[index+3];
    let valueA = mode1 == 0 ? codes[inputA] : inputA;
    let valueB = mode2 == 0 ? codes[inputB] : inputB;
    codes[output] = valueA + valueB;
}

func multiply(at index: Int, _ mode1: Int, _ mode2: Int, _ mode3: Int) {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let output = codes[index+3];
    let valueA = mode1 == 0 ? codes[inputA] : inputA
    let valueB = mode2 == 0 ? codes[inputB] : inputB
    codes[output] = valueA * valueB;
}

func jumpIfFalse(at index: Int, _ mode1: Int, _ mode2: Int, _ mode3: Int) -> Int {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let valueA = mode1 == 0 ? codes[inputA] : inputA
    let valueB = mode2 == 0 ? codes[inputB] : inputB
    if(valueA == 0) {
        return valueB
    }
    return index+3
}

func jumpIfTrue(at index: Int, _ mode1: Int, _ mode2: Int, _ mode3: Int) -> Int {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let valueA = mode1 == 0 ? codes[inputA] : inputA
    let valueB = mode2 == 0 ? codes[inputB] : inputB
    if(valueA != 0) {
        return valueB
    }
    return index+3
}

func lessThan(at index: Int, _ mode1: Int, _ mode2: Int, _ mode3: Int) {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let output = codes[index+3];
    
    let valueA = mode1 == 0 ? codes[inputA] : inputA
    let valueB = mode2 == 0 ? codes[inputB] : inputB
    if(valueA < valueB) {
        codes[output] = 1;
    } else {
        codes[output] = 0;
    }
}

func equal(at index: Int, _ mode1: Int, _ mode2: Int, _ mode3: Int) {
    let inputA = codes[index+1];
    let inputB = codes[index+2];
    let output = codes[index+3];
    
    let valueA = mode1 == 0 ? codes[inputA] : inputA
    let valueB = mode2 == 0 ? codes[inputB] : inputB
    if(valueA == valueB) {
        codes[output] = 1;
    } else {
       codes[output] = 0;
   }
}

func input(at index: Int) {
    let output = codes[index+1];
    codes[output] = input;
}

func output(at index: Int) {
    let outputPosition = codes[index+1]
    let output = codes[outputPosition]
    print("*********", output)
}

func calculate(at index: Int) -> Int {
    let instruction = NSString(string: String(codes[index]))
    let length = instruction.length
    let code = Int(instruction.substring(from: max(0, length-2)))!
    
    var mode1 = "0"
    var mode2 = "0"
    var mode3 = "0"
    if(length == 3) {
        mode1 = instruction.substring(with: NSRange(location: 0, length: 1))
    } else if(length == 4) {
        mode1 = instruction.substring(with: NSRange(location: 1, length: 1))
        mode2 = instruction.substring(with: NSRange(location: 0, length: 1))
    } else if(length == 5) {
        mode1 = instruction.substring(with: NSRange(location: 2, length: 1))
        mode2 = instruction.substring(with: NSRange(location: 1, length: 1))
        mode3 = instruction.substring(with: NSRange(location: 0, length: 1))
    }
    
    if(mode3 == "1") {
        print("WRITE IN IMMEDIATE MODE?!?!?!?!?")
    }
    
    var nextIndex = index
    if(code == 1) {
        add(at: index, Int(mode1)!, Int(mode2)!, Int(mode3)!)
        nextIndex+=4
    } else if(code == 2) {
        multiply(at: index, Int(mode1)!, Int(mode2)!, Int(mode3)!)
        nextIndex+=4
    } else if(code == 3) {
        input(at: index)
        nextIndex+=2
    } else if(code == 4) {
        output(at: index)
        nextIndex+=2
    } else if(code == 5) {
        nextIndex = jumpIfTrue(at: index, Int(mode1)!, Int(mode2)!, Int(mode3)!)
    } else if(code == 6) {
        nextIndex = jumpIfFalse(at: index, Int(mode1)!, Int(mode2)!, Int(mode3)!)
    } else if(code == 7) {
        lessThan(at: index, Int(mode1)!, Int(mode2)!, Int(mode3)!)
        nextIndex+=4
    } else if(code == 8) {
        equal(at: index, Int(mode1)!, Int(mode2)!, Int(mode3)!)
        nextIndex+=4
    } else if(code == 99) {
        return -1;
    } else {
        print("UNKNOWN INSTRUCTION")
    }
    return nextIndex;
}

func run() {
    var i = 0;
    var instruction = 0;
    while i < codes.count && instruction != -1 {
        if(i < 0 || i >= codes.count) {
            break;
        }
        i = calculate(at: i);
    }
}

run()
