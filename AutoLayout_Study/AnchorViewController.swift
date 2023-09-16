//
//  ViewController.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 2023/09/16.
//

import UIKit

class AnchorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupView()
    }
    
    func setupView() {
        let upperLeftLabel = makeLabel(withText: "upperLeft")
        let upperRightLabel = makeLabel(withText: "upperRight")
        let lowerLeftLabel = makeSmallerLabel(withText: "lowerLeft")
        let lowerRightButton = makeButton(withText: "lowerRight")
        let whiteView = makeView()
        
        view.addSubview(upperLeftLabel)
        view.addSubview(upperRightLabel)
        view.addSubview(lowerLeftLabel)
        view.addSubview(lowerRightButton)
        view.addSubview(whiteView)
        
        upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        lowerLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        lowerLeftLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        lowerRightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        lowerRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ///Option 1 - size explicitly
        //        whiteView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //        whiteView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        ///Option 2 - size Dynamically (pinning)
        whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    func makeSmallerLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = text
        label.font = UIFont.systemFont(ofSize: 8, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .gray
        return button
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }
    
    
}

