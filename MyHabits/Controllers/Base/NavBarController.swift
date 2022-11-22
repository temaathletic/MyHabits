//
//  NavBarController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = Resources.Colors.viewBackground
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.navBarText,
            .font: Resources.Fonts.sfProDisplaySemibold(with: 17)
            
        ]
        navigationBar.addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
}

