//
//  CustomView.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 1/12/24.
//

import UIKit

class CustomView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        let stackView = makeStackView(withOrientation: .vertical)
        let row = RowView()
        
        stackView.addArrangedSubview(row)
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
