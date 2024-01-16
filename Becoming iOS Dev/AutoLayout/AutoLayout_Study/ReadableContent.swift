//
//  ReadableContent.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/18.
//

import UIKit

class ReadableContent: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let label = makeLabel(withText: "ghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczxghjasdasdasdasdasdqwdqwdasdzxczxczxczx")
        view.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .red
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.backgroundColor = .yellow
        return label
    }
    
    deinit {
        print("ReadableContent이 화면에서 내려졌습니다.")
    }
}

