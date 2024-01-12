//
//  Scrollable.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 1/12/24.
//

import UIKit

class Scrollable: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        let stackView = makeStackView(withOrientation: .vertical)
        let scrollView = makeScrollView()
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        for i in 1...50 {
            let row = RowView()
            stackView.addArrangedSubview(row)
            // scrollView의 width 값을 주기 위함 - 없이는 intrinsic content size를 존중
            // row.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            
            if i % 5 == 0 {
                stackView.addArrangedSubview(makeSpacerView(withHeight: 100))
            }
            
            // padding 값을 제공하게 되면서 AutoLayout 충돌 발생, padding을 제공하기 위해 widthAnchor 조절
            row.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: -32).isActive = true
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        giveMargin(to: stackView)
    }
    
    func giveMargin(to stack: UIStackView) {
        // stackView가 담고 있는 child들에게 stackview의 margin 값을 사용하라고 안내
        stack.isLayoutMarginsRelativeArrangement = true
        
        // padding 값
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40, leading: 16, bottom: 40, trailing: -16)
    }
}
