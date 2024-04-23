//
//  ViewController.swift
//  AutolayoutFeedbackLoopTest
//
//  Created by Porori on 2/8/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
    override func viewDidLayoutSubviews() {
        view.setNeedsLayout()
        // intentionally breaking the layout constraint
        // https://www.hackingwithswift.com/articles/59/debugging-auto-layout-feedback-loops
    }
}

