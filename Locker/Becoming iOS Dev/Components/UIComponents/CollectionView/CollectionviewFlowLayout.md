# CollectionviewFlowlayout
collectionviewFlowlayout collectionview의 레이아웃과 깊게 연관되어 있다.

Flowlayout은 collectionview의 item간 간격(spacing)과 크기(size)를 조절할 수 있게 도움을 준다.
아이템은 collectionview에 담기는 하나의 cell을 의미하며 row는 횡, cloumn은 열을 의미한다.
Section을 가지고 있으며 Header, Footer 또한 별도로 설정할 수 있다.

하나의 특징은 하나의 고정된 축이 있으며 반대 축은 스크롤링이 가능한 형태를 가진다.
예를 들어 가로 collectionview일 경우, 높이는 고정된 반면 좌우로 스크롤링이 가능한 모습을 말한다!
*고정되는 비율과 크기는 collectionview를 따른다.

> - minimumInteritemSpacing<br/>
> - estimatedItemSize
> - sectionInset


### 추가 참고
- Customizing Collectionview Layout [[Link]](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/layouts/customizing_collection_view_layouts)