//
//  LayoutGuide.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/16.
//

import UIKit

class LayoutGuide: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
    }
    
    func setupViews() {
        let topLabel = makeLabel(withText: "상단에 있는 라벨입니다.")
        let bottomLabel = makeLabel(withText: "하단에 있는 라벨입니다.")
        let leadingLabel = makeLabel(withText: "왼쪽.")
        let trailingLabel = makeLabel(withText: "오른쪽.")
        
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(leadingLabel)
        view.addSubview(trailingLabel)
        
        // 방법1
//        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive =  true
//        bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
//        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // 방법2
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leadingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            trailingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trailingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }
    
    deinit {
        print("LayoutGuideViewController이 화면에서 내려졌습니다.")
    }
}
