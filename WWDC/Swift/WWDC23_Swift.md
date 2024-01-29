# WWDC19 - Optimizing App Launch

animation gives continuity
feels more natural to see an object move from 1 point to next

if velocity changes, doesn't' feel right.

### 1.Ease in and out
- no jump in velocity, constant

### 2. Linear
- a jump in velocity (be cautious)
- non physical behavior is present

### 3. Spring
- looks the best, but only on point one.



Ease and out jerks to halt as animation ends.
no initial velocity


Spring has any velocity


### Shape of motion
- 



mass
stiffness - spring
damping - how much friction is given to the object

초기 위치에서 목적 위치로 이동할 때 animation이 작동된다.

### spring을 적용하는 방법
- bounce 와 durcation을 적용하면 된다.
(>, 0%, < -100%) bounce를 활용할 수 있다.
bouncy, smooth, flattened


velocity Preservation



// 기본으로 smooth, snappy, bouncy가 적용되어 있다.
```swift
withAnimation(.snappy(duration:0.4, extraBounce: 0.1)) {
    isActive.toggle()
}


withAnimation(.spring(duration: 0.6, bounce: 0.2)) {
    isActive.toggle()
}

// UIKit
UIView.animate(duration: 0.6, bounce: 0.2) {
    // extra code
}

// Spring Model
let otherSpring = Spring(mass: 1, stiffness: 100, damping: 10)
withAnimation(.spring(otherSpring)) {
    isActive.toggle()
}
```

모를 때는 0을 활용하고 bounce가 40% 이상을 넘어가면 애매해진다.
어플의 분위기에 따라 그 이상을 적용하거나 적게 적용하는 것도 방법이다! (what's the app's feeling?)