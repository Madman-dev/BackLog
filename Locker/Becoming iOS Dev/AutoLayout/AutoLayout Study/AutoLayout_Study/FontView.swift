//
//  FontView.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/16.
//

import UIKit

class FontView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupView()
    }
    
    func setupView() {
        let smallLabel = makeLabel(withText: "작은 레이블", size: 10)
        let bigLabel = makeLabel(withText: "큰 레이블", size: 20)
        
        view.addSubview(smallLabel)
        view.addSubview(bigLabel)
        
        smallLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        smallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        bigLabel.firstBaselineAnchor.constraint(equalTo: smallLabel.firstBaselineAnchor).isActive = true
        bigLabel.leadingAnchor.constraint(equalTo: smallLabel.trailingAnchor, constant: 8).isActive = true
    }
    
    func makeLabel(withText text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.backgroundColor = .cyan
        label.font = UIFont.systemFont(ofSize: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    deinit {
        print("FontViewController이 화면에서 내려졌습니다.")
    }
}
