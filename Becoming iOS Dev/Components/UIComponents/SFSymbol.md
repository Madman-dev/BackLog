## SFSymbol

애플에서 제공하는 아이콘이라 볼 수 있는 SF Symbol
SanFrancisco System Font를 weight, size에 따라 자유자재로 변경이 가능하기 때문에 SFSymbol이라 부르는게 아닐까 싶다.

아이콘인만큼 어디에도 활용할 수 있다.

SFSymbol를 활용할 수 있는 방법들은 많은데, 시각적으로 모든 요소들의 변동을 줄 수 있다.

A. Rendering Mode
SF Symbol 3 이후로는 4가지의 렌더링 모드를 제공하고 있다.
Monochrome, hierarchical, palette, multicolor은 어플의 다양한 컬러와 함께 심볼의 무게를 다르게 만들 수 있다.

SFSymbol은 symbol 패스(path)를 하나의 레이어로 가지고 있는데,
cloud.sun.rain.fill symbol은 3가지로 구성되어 있다고 볼 수 있다.
메인이 되는 cloud, 그 뒤를 받쳐주는 sun & rays, 그리고 마지막으로 raindrop이 tertiary layer이 된다.

각각의 요소들이 서로 다른 패스 및 레이어로 구분이 되는 만큼 rendering mode를 활용해서 서로 다른 색상을 적용할 수 있다.
opacity 또한 제공할 수 있게 되는 것!

1. Monochrome - 단일 색상을 모든 레이어에 적용한다. 레이어에 있는 패스는 지정된 색상을 입거나 투명한 색상을 적용한다.
2. Hierarchical - 단일 색상을 모든 레이어에 적용한다. 단, 레이어에 따라 자발적으로 해당 컬러의 투명도를 조절한다.
3. Palette - 두 가지 이상의 색상을 적용한다. 만일 세 가지 색상을 활용하는 symbol일 경우 2,3 번째 색상은 동일한 색상을 활용한다.
4. MultiColor - 해당 symbol이 가지는 특색이 담긴 색상을 활용한다. 예를 들어 나뭇잎을 뜻하는 leaf는 초록색을 활용하여 깊이를 더하는 것과 같다.


B. Variable Color
symbol이 가지는 특징을 전달하기 위해 적용된 variable color.
어떤 값이 0~100%에 도달하는지에 따라 symbol의 레이어를 쪼개어 적용한다.

간단하게 소리를 줄이고 높일 때 volume의 퍼지는 모습을 보이는 wave 레이어의 컬러가 줄어졌다 늘어났다 하는 모습을 생각하면 된다!

단, Variable color는 변화를 알리기 위해 활용해야할 뿐, 깊이를 전달하기 위해서 사용하면 안된다고 한다. 시각적 계층과 깊이를 더하기 위해선 hierarchical rendering mode를 활용하여 레이어를 향상할 수 있도록 해야한다!

C. Weight and Scale
- 이건 추가 예정 -

D. Design Variants
- 이것도 추후 추가 예정 -

E. Animation
- SFSymbol 5 이후부터 제공되는 SFSymbol Animation은 어플의 생동감을 전달하고 인터페이스를 향상시킬 수 있도록 돕는다. 한 예로 사용자들의 행동에 대한 피드백과 현재 지냉 중인 활동 및 상태에 대해 변화 혹은 안내를 할 수 있다.

하지만 고려해야하는 점들은 존재하는데, 적용할 수 있는 갯수의 제한이 있는게 아니기 때문에 적당히 사용자들이 보는데 불편하지 않도록 조절해야한다.


### 참고
- https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Custom-symbols