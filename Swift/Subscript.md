# What is a subscript?

## TIGO(Today I Go Over)
### 학습 내용
Subscipt is a way to access member elements of a collection list and sequence without any function or method. This enables the user to gain access or enter into values within collections, classes, structs, enums. (From what I know mostly used within Collections rather than classes, structs and enums).
Subscripts are used through using '[]'
<br/> 
```swift
struct TimeTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("Six times three is \(threeTimesTable[6])")
```

The following code is a struct that holds multiplier as its property.
we gave a value of its property 3 as mentions above. TimesTable(multiplier: 3).
Then, we gave its index value by 6 using subscript.
Which in this case is used to set a value rather than finding the numbers within a certain field.
Overall, as the given index value is 6 and multiplier is 3, the printed value will return 18.
<br/><br/> subscripts are to be Read-Write or Read Only, you can't give a value alone.
In addition, when accessing a value using subscript, the index point needs to be ATLEAST greater than equal to the start index.
This is a computer will be 0 and the final index must be value - 1.
<br/><br/>

### 코드 활용
```swift
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
  var ans = [String]()
  var board1 = arr1.map{ Array(String($0, radix: 2)) }
  var board2 = arr2.map{ Array(String($0, radix: 2)) }
  for i in 0..<n {
    var tmp = ""
    while board1[i].count < n { // enter into value of board1
      board1[i] = "0" + board1[i]
    }
    while board2[i].count < n {
      board2[i] = "0" + board2[i]
    }
    for j in 0..<n {
      if board1[i][j] == "1" || board2[i][j] == "1" {
        tmp += "#"
      } else {
        tmp += " "
      }
    }
    ans.append(tmp)
  }
  return ans
}
```

<br/>

### 궁금증
Q. Why do computers calculate index with 0, not 1?