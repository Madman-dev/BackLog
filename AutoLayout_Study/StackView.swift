//
//  StackView.swift
//  AutoLayout_Study
//
//  Created by Jack Lee on 1/10/24.
//

import UIKit

class CHCRFill: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
    }
    
    func setView() {
        let stack = makeStackView(withOrientation: .vertical)
        stack.distribution = .fill
        
        stack.addArrangedSubview(makeLable(withText: "Big", size: 128, color: .yellow))
        stack.addArrangedSubview(makeLable(withText: "Mid", size: 64, color: .blue))
        stack.addArrangedSubview(makeLable(withText: "Sml", size: 32, color: .red))
        
        view.addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

/*
 stackviews don't have a height of themselves.
 이전에 작업했던 alignment, distribution 관련해서 복습
 
 - stackViews want views inside to have an intrinsic size
 -> changing the value to 'Fill Equally' limits and clips the pre-given constraint.
 
 Some Distributions are respected. and other do not.
 Thus,
 
 simple container that is able to change size according to the contents it holds.
 
 MARK: - Distribution Fill
 - Default setting
 - Fills all available space
 - Uses CHCR but if the CHCR is equal, there will is problems
 
 MARK: - Distribution Equally
 - Content hugging Priority will not matter (THE ONLY Distribution that will not follow)
 - Makes every content size equal
 fill equally breaks the optional intrinsic content size in order to fill equally.
 Carefully tread when using so.
 
 MARK: - Fill Porportionally
 maintains proportions as layout changes
 
 MARK: - equal spacing
 maintains equal space between each control
 
 MARK: - equal centering
 space equally between center of controls
 */
