//
//  ContentSize.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/18.
//

import UIKit

class ContentSize: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        let label = makeLabel(withText: "label1")
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        /// 직접 값을 제공할 수 있음 > Label의 크기가 알아서 바뀐다. > Intrinsic ContentSize 변경
//        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        /// pinning
//        label.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -8).isActive = true
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = BigLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        return label
    }
    
    deinit {
        print("contentSize가 화면에서 내려졌습니다.")
    }
}

/// intrinsic Value를 변경하는 방법
class BigLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 300)
    }
}
