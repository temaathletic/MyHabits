//
//  HabitController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

class HabitController: BaseController {
    
    private let navBar = HabitNavController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        addViews()
        layoutView()
        
    }
    
}

extension HabitController {
    
    override func setupView() {
        super.setupView()
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
        title = "Сегодня"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.habit
    }
    
    override func layoutView() {
        super.layoutView()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            navBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 140),
        ])
    }
    
    override func addViews() {
        super.addViews()
        
        navigationController?.isNavigationBarHidden = true
        view.addSubview(navBar)
    }
}

addBottomBorder(with: <#T##UIColor#>, height: <#T##CGFloat#>)


