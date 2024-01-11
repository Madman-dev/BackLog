//
//  Image.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/18.
//

import UIKit

class ImageCHCR: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        let image = makeImageView(named: "rush")
        let label = makeLabel(withText: "Title")
        let button = makeButton(withText: "Get Started")
        
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            /// 아래와 같이 구성하게 되면 각 UIComponent별 height가 모호하게 설정된다. 따라서 기종별로 보이는 구성이 다르게 나온다! - CHCR 적용
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 300),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    public func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)
        
        // 이렇게 CHCR을 해결 - 기종에 따라 이미지 크기가 자유롭게 변경될 수 있도록 설정하게 된 것! > 지금 simulator 기종들로는 적용하지 않아도 잘 보이긴 한다! ㅠ
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        return view
    }
    
    public func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }
    
    public func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .red
        return button
    }
    
    deinit {
        print("Image Controller가 화면에서 내려졌습니다.")
    }
}
