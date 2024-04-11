import UIKit

/*
 Not DRY - AHA!
 */


//MARK: - AVOID HASTY ABSTRACTION
//struct Person {
//    struct Name { 
//        var honorific: String
//        var first: String
//        var last: String
//    }
//    
//    var name: Name
//    var username: String
//}

struct Name {
    var honorific: String
    var first: String
    var last: String
}

struct Person {
    let name: Name
    let username: String
}

// 1차 Abstraction
func getDisplayName(name: Person) -> String {
    return "\(name.name.first) \(name.name.last)"
}

// 2차 Abstraction
func getDisplayname(user: Person, includeHonorific: Bool = false, includeUsername: Bool = false, firstInitial: Bool = false, onlyUsername: Bool = false) -> String {
    var displayName = "\(user.name.first) \(user.name.last)"
    
    if firstInitial {
        var first = user.name.first
        first = String(first.prefix(1)) + "."
        
        displayName = "\(first) \(user.name.last)"
    }
    
    if includeHonorific {
        displayName = "\(user.name.honorific) \(user.name.first)"
    }
    
    if includeUsername {
        displayName = "[\(user.username)] \(user.name.honorific) \(user.name.first)"
    }
    
    if onlyUsername {
        displayName = "\(user.username)"
    }
    
    return displayName
}

let jack = Person(name: Name(honorific: "의사", first: "잭", last: "리"), username: "잭잭")
//let phil = Person(name: Person.Name(honorific: "의사", first: "필립", last: "로드리게스"), username: "필립필립")
//let displayname = getDisplayname(user: phil)
//let cardDisplayName = getDisplayname(user: phil, onlyUsername: true)
//let profileDisplayName = getDisplayname(user: phil, includeHonorific: true)
//let navDisplayName = getDisplayname(user: phil, firstInitial: true)


let displayname = "\(jack.name.first) \(jack.name.last)"
let display = getDisplayName(name: jack)
let cardDisplayName = "\(jack.username)"
let profileDisplayName = "\(jack.name.honorific) \(jack.name.first)"
let navDisplayName = String(jack.name.first).prefix(1) + ". " + "\(jack.name.last)"



/*
 1. Beginning
 초기에는 일일히 필요한 출력 데이터를 입력.
 e.g) 
 let displayname = "\(phil.name) \(phil.name.first)"
 let cardDisplayName = "\(phil.name.first) \(phil.name.last)"
 
 > 오타 또는 실수가 발생하면 각각의 코드로 가서 직접 모든 값을 바꿔야 하는 불필요한 time consumption.
 >> 그로 인해 1차 Abstraction을 적용하게 된다.
 
 
 2. 1차 Abstraction
 필요한 위치에 함수를 호출하도록 하고, 필요할 때 function 자체에서만 값을 바꾸면 모든 문제 해결!
 > 문제는 '특정' 위치에서 다른 값을 추가하고 싶어질 때 발생하게 된다.
 
 
 === profileDisplayName에서 Honorific을 추가했으면 좋겠다는 의견 ===
 ➡ honorific이 없기 때문에 1차 추상화에 코드를 변경하기로 한다.
 *대부분 추상화가 이미 되어 있기에 포기를 하지 않는다.*
 
 3. 2차 Abstraction
 profile 페이지에서만 새로운 이름이 보일 수 있도록 추상화된 함수를 수정하게 된다.
 조건을 하나 더 걸게 되었지만, 기존처럼 한 곳에서 코드를 수정하게 되면 모든 영역에서 호출하는 코드가 바뀌게 된다!
 > 성공!
 
 
 === displayName에서 username을 괄호 안에 넣는 방식으로 추가했으면 좋겠다는 의견 ===
 추상화된 코드에 해당 조건이 없다는 부분 확인, 추가 코드 수정 진행
 
 4. 3차 Abstraction
 다른 조건인 includeUsername을 추가하게 된다.
 > 성공!
 
 === navDisplayname에서 이름이 아닌 사용자 자음만 보일 수 있도록 만들어 달라는 의견 ===
 추상화된 코드에 해당 조건이 없다는 부분 확인, 추가 코드 수정 진행
 
 5. 4차 Abstraction
 다른 조건인 firstInitial을 추가하게 된다.
 > 성공!
 
 === cardDisplayname에서 first 이름만 보이도록 만들어 달라는 의견 ===
 다른 조건인 firstInitial을 추가하게 된다.
 > 성공!
 
 
 기능을 더할수록 문제가 발생하는 것을 느끼게 된다.
 하지만 이미 한번 추상화 해둔 코드인만큼 아쉬움을 느끼게 되는데, 이 느낌을 느낄 때 더 빠르게 벗어나는 방법이 가장 좋다!!!
 >> HOW?
 >>> We back out through inlining the code
 >>>> 적용한 이후, displayName 추상화 함수는 완전히 삭제해도 된다!
 */



/*
여기서 강연자는 아래 3가지 데이터는 동일한 데이터 구성이 아니라고 말한다.
비슷해보이지만, 초기 구조에서 크게 벗어난다는 점이다.

let cardDisplayName = getDisplayname(user: phil, includeUsername: true)
let profileDisplayName = getDisplayname(user: phil, includeHonorific: true)
let navDisplayName = getDisplayname(user: phil, firstInitial: true)

 
 더불어 추가해 놓은 코드는 삭제할 가능성이 적다고 하는데, 만일 추가한 기능을 더이상 적용하지 않게 되면,
 선언한 위치에서만 코드를 삭제할 뿐, 함수 자체에서 해당 기능을 삭제하지 않는다고 한다.
 그 이유는 선언하는 위치에서 삭제하는 방식이 문제가 없을 가능성이 높기 때문에 - 혹여나 코드를 건드렸다가 발생할 수 있는 위험도를 수치로 보여준다면,
 함수를 수정하는 방식은 위험도가 높을 것이라고 생각하게 된다.
 
 추가로 '추후에', '언젠가' 다시 사용하지 않을까? 하는 생각으로 코드를 내버려두는 것이다.
 
 
 DRY 자체는 나쁘지 않다!
 반복되는 코드를 줄일 수 있다는 점은 엄청난 장점이다.
 하지만, 너무 많은 추상화는 오히려 문제를 더 발생시킨다. duplication을 더 선호하는 자세를 가지는게 때로는 좋다.
 더불어 복사한 코드에서 문제를 외치도록 기다린 이후, 고민해보는 방식이 훨씬 긍정적인 현상을 보여줄 것이다!
 다양한 브랜치에서 사용되고 있다면, '조건문' 혹은 condition을 추가하지 말고 refactoring을 진행해라!
 */
