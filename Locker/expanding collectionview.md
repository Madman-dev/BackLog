# Collectionview cell

> ## 탭하면 셀 속에 담긴 UIComponent가 보이는 기능

지금 프로젝트에서 가장 구현해보고 싶었던 작은 기능이다.
셀을 탭하면 정보들이 보일 수 있도록 만들고 싶었다.
대단한 내용을 아니지만, 필요에 따라 view 안에 있는 데이터를 보여줄 수 있고 없고는 중요한게 아닐까 싶다.
그게 viewController에 있는 정보가 아니더라도!

### 🥚 Breakdown
1. 셀안에 컴포넌트 생성
2. 컴포넌트의 autolayout을 해주는 메서드를 생성
3. 셀을 탭했을 때 컴포넌트가 보이는지 확인
4. 다시 탭했을 때 컴포넌트가 사라지는지 확인
5. 탭 상태를 확인할 수 있는 변수가 필요할지 고민
6. 셀을 탭한 상태에서 다른 셀을 탭하면 발생하는 문제는 없는지 확인

### 🐣 생각 정리
- 테이블 뷰 같이 순서와 사이즈가 정해진 cell에서 적용해본 적은 있다.Flowlayout 값이 다르게 적용될 수 있는 collectionview에서는 자연스럽게 바뀔 수 있을까?
- 이전 프로젝트 로그인 페이지에서 비슷한 기능을 활용했었는데, 숨겨진 component가 보일 수 있도록만 적용했다. collectionviewCell은 탭이 여러번 반복될 수 있는 상황이니 더 복잡할까?

- ⭐️ 셀 속에 autolayout 메서드와 컴포넌트 데이터 값을 변경하는 메서드를 담다보니 view역할을 해야하는 cell이 너무 많은 책임을 가지고 있다는 점을 느낀다.
책임만 따진다면 해당 셀 안에 있는 컴포넌트이기 때문에 올바르게 만들어 놓은 것 같지만 복잡해지는 cell, 디자인 패턴 등을 고려하면 완성한 이후 잘 고민해봐야겠다. ⭐️

## 🐔 접근 시도

### 1. layoutIfNeeded()
일단 확인하고 싶었던 건, 탭하면 추가한 component가 보이는지 알고 싶었다.
collectionview cell안에 있는 컴포넌트의 autolayout을 새롭게 잡아주면 되겠다 생각했다.
새롭게 추가될 컴포넌트를 다른 메서드로 빼두고 layoutIfNeeded()를 호출하면 collectionview가 알아서 적용해줄 것 같았다.

```swift
func configureOpenedStack() {
    stackView.addArrangedSubview(dataLabel)
    stackView.addArrangedSubview(dataLabel2)
    
    NSLayoutConstraint.activate([
        dataLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor),
        dataLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        dataLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        
        dataLabel2.topAnchor.constraint(equalTo: dataLabel.bottomAnchor),
        dataLabel2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        dataLabel2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
    ])

    layoutIfNeeded()       
}
```
의도했던대로 추가는 되었지만 layoutIfNeeded()는 어떠한 작업도 하지 않았는데,
애초에 autolayout이 위치를 잡고 있기에 별도로 호출할 필요가 없었다.

### 2. conditional
탭 여부에 따라 숨기거나 보여야했기에 불리언 값을 직접 받았다.
별도로 변수로 관리를 하지 않은 이유는 isHidden이 이미 존재했기에 굳이 만들 필요는 없어보였다.

```swift
func configureOpenedStack(show: Bool) {
        if show {
            stackView.addArrangedSubview(dataLabel)
            stackView.addArrangedSubview(dataLabel2)
            
            NSLayoutConstraint.activate([
                dataLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor),
                dataLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                dataLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                
                dataLabel2.topAnchor.constraint(equalTo: dataLabel.bottomAnchor),
                dataLabel2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                dataLabel2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            ])
            
            dataLabel.isHidden = false
            dataLabel2.isHidden = false
        } else {
            dataLabel.isHidden = true
            dataLabel2.isHidden = true
        }
    }
```

VC에서도 선택에 따라 값을 제공하는 방식으로 출력 시킬 수 있었다.
```swift
if selectedIndexPath?.row == indexPath.row {
                print("줄었습니다.")
                cell.configureOpenedStack(show: false)
                selectedIndexPath = nil
            } else {
                print("키웠습니다.")
                cell.configureOpenedStack(show: true)
                selectedIndexPath = indexPath
            }
```

### 다른 셀을 탭했을 때 발생하는 추가 문제
이미 커진 셀을 탭해서 다시 줄이면서 component를 줄일 수는 있었다. 하지만 커진 셀에서 다른 셀을 탭하면 데이터가 사라지지 않는 점을 볼 수 있었다. 답은 간단했는데, didDeSelectItemAt에서 메서들 추가로 호출해주면 해결이 되었다. 현재 셀에서 다른 셀로 넘어가는 것으로 인지를 하고 기존 셀 사이즈를 줄이고 선택된 셀의 크기를 키워주기 때문인데, 이 때 기존 셀 안에 있던 값을 숨기지 않았기에 발생하던 문제점.
```swift
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PokeCollectionViewCell {
            print("다른 셀을 눌렀습니다")
            cell.configureOpenedStack(show: false)
        }
    }
```

> Selectively resizing components

### 별도 constraint 설정
```swift
private func stack() {
        addSubviews(stackView)
        
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func imageView() {
        stackView.addArrangedSubview(pokeImage)
        
        
        pokeImageLeading = pokeImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        pokeImageTrailing = pokeImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        pokeImageTop = pokeImage.topAnchor.constraint(equalTo: stackView.topAnchor)
        
        pokeImageLeading.isActive = true
        pokeImageTrailing.isActive = true
        pokeImageTop.isActive = true
    }
    
    private func label() {
        stackView.addArrangedSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
    
    func configureOpenedStack(show: Bool) {
        if show {
            stackView.addArrangedSubview(dataLabel)
            stackView.addArrangedSubview(dataLabel2)
            
            pokeImageLeading = nil
            pokeImageTrailing = nil
            pokeImageTop = nil
            pokeImageWidth = pokeImage.widthAnchor.constraint(equalToConstant: 40)
            pokeImageHeight = pokeImage.heightAnchor.constraint(equalToConstant: 40)
            pokeImageWidth.isActive = true
            pokeImageWidth.isActive = true

            
            NSLayoutConstraint.activate([
                dataLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor),
                dataLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                dataLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                
                dataLabel2.topAnchor.constraint(equalTo: dataLabel.bottomAnchor),
                dataLabel2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                dataLabel2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            ])
            
            dataLabel.isHidden = false
            dataLabel2.isHidden = false
        } else {
            dataLabel.isHidden = true
            dataLabel2.isHidden = true
        }
    }
```

### CHCR

```swift
            pokeImage.contentCompressionResistancePriority(for: .horizontal)
            pokeImage.contentCompressionResistancePriority(for: .vertical)
```

### containerView

### stackView autolayout 축소