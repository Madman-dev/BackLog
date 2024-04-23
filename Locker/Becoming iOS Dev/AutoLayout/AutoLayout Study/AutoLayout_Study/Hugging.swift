//
//  File.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/18.
//

import UIKit

class Hugging: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        let topLeftLabel = makeLabel(withText: "Name")
        let testTextfield = makeTextfield(withPlaceholder: "이름을 넣으십쇼!")
        
        view.addSubview(topLeftLabel)
        view.addSubview(testTextfield)
        
        NSLayoutConstraint.activate([
            topLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            topLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            testTextfield.firstBaselineAnchor.constraint(equalTo: topLeftLabel.firstBaselineAnchor),
            testTextfield.leadingAnchor.constraint(equalTo: topLeftLabel.trailingAnchor, constant: 8),
            
            /// TextField가 늘어나지 않는 이유는 it doesn't have a width?
            /// Doesn't know the size of the textField.
            testTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        /// 이게 되는 이유는 기본 값이 250, 750이기 때문?
        topLeftLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .red
        return label
    }
    
    func makeTextfield(withPlaceholder text: String) -> UITextField {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = text
        textfield.backgroundColor = .lightGray
        return textfield
    }
}
