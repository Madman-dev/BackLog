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
        
        for _ in 1...50 {
            let row = RowView()
            stackView.addArrangedSubview(row)
            // scrollView의 width 값을 주기 위함 - 없이는 intrinsic content size를 존중
            row.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
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
    }
}
