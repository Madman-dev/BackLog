//
//  RowView.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 1/12/24.
//

import UIKit

class RowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let titleLabel = makeLabel(withText: "Gapless Content")
        let onOffSwitch = makeSwitch(isOn: true)
        
        [titleLabel, onOffSwitch].forEach { self.addSubview($0) }
        
//        addSubview(titleLabel)
//        addSubview(onOffSwitch)
        
        // No gaps between components as parent have a intrinsic content size of its own.
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        onOffSwitch.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 31)
    }
}
