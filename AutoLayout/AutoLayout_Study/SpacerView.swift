//
//  SpacerView.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/17.
//

import UIKit

class SpacerView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func makeButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 16, bottom: 8, right: 16)
        button.backgroundColor = color
        return button
    }
    
    func setupView() {
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(title: "ok", color: .blue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(title: "cancel", color: .green)
        let trailingGuide = UILayoutGuide()
        
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        view.addLayoutGuide(leadingGuide) // addSubView와 다르다.
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        
        
        // margin은 view 자체의 범위를 의미하는 것으로 보인다. 단, leading과 trailing의 규격을 어느정도 둔!
        let margin = view.layoutMarginsGuide
        
        margin.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor).isActive = true
        
        // middle guide
        okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        
        // trailing guide
        cancelButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        //button equal width > 동일한 규격을 만들 수 있다!
        okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        /// 오토레이아웃을 사용할 때 ambiguous하면 안된다. 지금도 UILayoutGuide의 넓이만 정했을 뿐 별도의 높이가 지정되지 않아 애매한 상황이다.
        /// 에러가 발생하거나 의도하던대로 화면이 안 그려질 수 있는데, 그걸 방지하고자 width, height를 모두 제공하는게 가장 바람직하다.
        
        
        leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trailingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
