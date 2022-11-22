//
//  BaseController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

enum NavBarPosition {
    
    case left
    case right

}

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
    
    func navBarLeftButtonHandler() {
        print("L tap")
    }
    
    func navBarRightButtonHandler() {
        print("R tap")
    }
}

extension BaseController {
    
    func addNavButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inActive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.sfProDisplayBold(with: 17)
        
        switch position {
            
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

        }
    }
}


