//
//  BaseController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

@objc extension BaseController {
    
    func addViews() {}
    func layoutView() {}
    func setupView() {
        
        view.backgroundColor = Resources.Colors.viewBackground
    }
    
    
}
