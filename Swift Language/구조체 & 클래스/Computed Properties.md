## Computed Properties

프로퍼티는 여러가지로 구분이 된다.
Stored, Lazy stored, Computed로 구분을 할 수 있다.
Stored Property의 경우, 데이터를 메모리 위에 보관하기하는 구조로 사용을 한다.
Computed Property의 경우, 값을 바로 계산을 하는 구조를 가진다.

둘 다 특정 타입에서 생성된 인스턴스와 연관이 되는데, 타입 자체에 프로퍼티가 연결되는 경우도 있다. 해당 프로퍼티들은 타입 프로퍼티라 칭한다.


// MARK: - Computed Property
우리가 특히 연산 프로퍼티를 활용하는 이유가 있다고 한다.
실시간으로 데이터를 업데이트함으로써 변화를 기록할 수 있기 때문인데, 프로퍼티의 값이 변화되도 '변한' 값을 가지게 되면서 "하나의 값"만 가르키게 된다.

```swift
stuct TimeEntry {
    let title: String
    var start: Int
    var end: Int
    // 연산 프로퍼티 예- 해당 duration은 start과 end에 담긴 값을 바라보는 방법일 뿐
    var duration: DateComponent {
        Calendar.current
            .datComponents([.hour, .minute, .second], from: start, to: end)
    }
}
```

duration은 데이터를 따로 담는 것이 아니라 start과 end를 참고하여 데이터 값을 도출해낸다.
즉, 지속적으로 변하는 값이 아니면 안된다는 점이다!

// 장점 1
연산 프로퍼티가 일종의 메서드처럼 보이지만 해당 프로퍼티를 호출하는 개발자, 혹은 코드를 읽는 개발자에게 메서드처럼 보이지 않기 위함이다.

// 장점 2
사용자가 직접 데이터를 입력해서 바꿀 수 있다는 점이다.
일일히 모든 데이터를 입력해야한다면 사용자 경험성이 떨어지는 모습을 보일 것이다.
'직접 적은 데이터를 기준으로 start 또는 End의 시간을 계산할 수 있게 된다'


// MARK: - Property Observers
Property Observers를 두어 프로터피 값의 변화를 기록할 수 있는데, 이에 따라 알맞는 행동을 할 수 있도록 연결 할 수 있다. 

// get set
연산 프로퍼티의 값을 읽고 쓸 수 있다!
```swift
struct TimeEntry {
    let title: String
    let start: Date
    var end: Date

    var duration: DateComponent {
        // 데이터를 읽는(read-only) 구조
        get {
            Calendar.current
            .dateComponents([.hour, .minute, .second], from: start, to: end)
        // 데이터를 쓰는(write) 구조
        } set {
            end = Calendar.current
            // 데이터에 변화가 없으면 현재 end 값을 적용하는 방식
            .date(byAdding: newValue, to: start) ?? end
        }
    }
}
```

해당 방식을 통해 별도 메서드 또는 함수를 호출하지 않아도 데이터 변화를 적용할 수 있다.
더불어 하나의 프로퍼티에 값을 읽고 쓸 수 있는 2가지 방식을 적용할 수 있게 된다.

// MARK: - using Extension
we give a direct value of an hour through implementing computed property. && through extension, we are able to add and configure additional data changes we'd like. Which stored properties are unable to instantiate (data type or size will have to change if plan to use stored properties)

```swift
extension TimeEntry {
    var hours: Double {
        DateInterval(start: start, end: end).duration * 3600
    }
}
```

*when to use an extension for computing properties
1. Keeping code organizedby functionality
2. Adding convenience that does not belong to the type itself - data formatting from UI
3. Sharing types between apps without sharing code specific to a project (NO CLUE!)

// > 하나의 entry는 하루 일한 시간이라 계산이 되는데, 이때 DateComponent를 활용해서 계산을 하면 복잡하고 직관적이지 않기 때문에 hour 프로퍼티를 연산 프로퍼티로 생성하게 된 구조

```swift
struct Project {
    let name: String
    let entries: [TimeEntry]
    let rate: Int

    var billableAmount: Int {
        // adding up the entries' duration in one property
        let totalDuration = entries.reduce(0.0, {$0 + $1.hours})
        return Int(totalDuration * Double(rate))
    }
}
```


// adding type to a value you don't own
in MVC, data Types should not contain any code that's related to UI.
**such as currencyFormat*

extension Int {
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}