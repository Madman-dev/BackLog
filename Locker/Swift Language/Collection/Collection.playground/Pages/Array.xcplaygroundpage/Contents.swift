/*
 1. sort in order
 2. a collection of Distinct type
 3. subscript를 통해 접근 가능
 4. 중복 데이터 정리 가능
 
 - BUT, 배열은 메모리상에 생성할 때 새로운 배열을 복사해서 생성하기에 부담이 될 수 있다!
 */

import UIKit

let swift = ["Tuple", "Array", "Set", "Collection",]
print(swift)

//MARK: - 영화 갯수, 러닝타임, 장르

let count: Int = .random(in: 1...200)
let runtime = count * 120
var genreList = ["로맨스", "SF", "스릴러", "액션", "코미디"]

genreList[2] = "영화"
genreList

let genre = genreList.randomElement()!
//let genre = genreList[100]  // causes the app to shut down during runtime. Can't find 99th indexed data within genreList - which was searched after the app was initiated.
let rating: Double = .random(in: 1...5)


print("""
오늘까지 총 \(count)개의 영화를 봤습니다.
시간으로 환산하면 총 \(runtime)분을 본 거라던데...
인생... ㅎ ㅜ...

이 중, 가장 많이 본 장르가 \(genre)라고 하더라구요!
최근 본 영화 평점은 \(rating)주고 싶네요 :)
""")

// 배열은 같은 타입끼리만 정리가 가능하다~
// index 위치가 존재하는데, 시작은 0부터 된다~
// Array들에 들어가는 순서! 내가 방금 본 000를 할 때도 비슷하다.

//MARK: - Recent Search

//print(searchList)
var searchList: [String] = []//"원피스", "바지", "자켓"]
searchList.insert("원피스", at: 0)

searchList.insert("신발", at: 1)
print(searchList)

searchList.remove(at: 1)
print(searchList)


searchList.insert("양말", at: 1)
print(searchList)

// append는 항상 마지막~
searchList.append("바지")
searchList.append("iPhone")
print(searchList)

searchList.append(contentsOf: ["시계", "게임기", "안경"])
print(searchList[2])

searchList[5] = "친구들"
print(searchList)

searchList.remove(at: 0)
searchList.remove(at: 3)
print(searchList)
searchList.removeAll()
print(searchList)


//MARK: - 2차원 배열
let sampleTest: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 10, 12, 81]]

sampleTest.count
let anotherArray = sampleTest[1]
anotherArray[1] == sampleTest[1][1]
anotherArray[1]
sampleTest[1][1]
