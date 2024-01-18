/*
 1. Holds Distinct Type
 2. set은 type annotation을 꼭 사용해야하며 중복은 안됨
 */

import UIKit

let array: [Int] = [1, 1, 1, 1]
print(array)

let testSet: Set<Int> = [1,2,3,4,1]


let set: Set = [1, 1, 1 ,1 ,1]
print(set)

var two: Set = [1, 1, 1, 1, 2, 3, 2, 2, 2, 3, 4, 5, 6, 6]
var three: Set = [3, 6, 9, 12, 15, 18]

print(two, three)   /// 겹치는 부분들은 하나로 통합해서 보여줄 뿐, 제거된건 아니다


let jack: Set<Int> = [1,2,3,4,5,6,7,8]
let minsu: Set<Int> = [2,4,6,8]
jack.intersection(minsu)
jack.union(minsu)
//var jack: Set = ["A", "B", "C", "D", "E", "F"]
//var minsu: Set = ["A", "B", "D", "J"]

let commonFriends = jack.intersection(minsu)
print(commonFriends)

let union = jack.union(minsu)
print(union)
