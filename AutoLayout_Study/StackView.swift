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
        
        let bigLabel = makeLable(withText: "Big", size: 128, color: .yellow)
        let medLabel = makeLable(withText: "Mid", size: 64, color: .blue)
        let smallLabel = makeLable(withText: "Sml", size: 32, color: .red)
        [bigLabel, medLabel, smallLabel].forEach { stack.addArrangedSubview($0) }

        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // giving a priority value to mediumLabel > Big Label is fitted following its intrinsic value
        medLabel.setContentHuggingPriority(UILayoutPriority(48), for: .vertical)
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
