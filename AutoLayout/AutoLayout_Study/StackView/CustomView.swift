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
        
        // centering the view - changes size according to intrinsic content size (from children)
//        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // giving a pin to the view's layout - override the intrinsic content size and meet the requirements below
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
