//
//  TabBarController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

enum Tabs: Int {
    case habit
    case info
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.tabBarBackground
        tabBar.backgroundColor = Resources.Colors.tabBarBackground
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let habitViewController = HabitController()
        let infoViewController = InfoViewController()
        
        let habitNavigationController = NavBarController(rootViewController: habitViewController)
        let infoNavigationController = NavBarController(rootViewController: infoViewController)
        
        habitNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.habit,
                                                            image: Resources.Images.TabBar.habit,
                                                            tag: Tabs.habit.rawValue)
        
        infoNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.info,
                                                           image: Resources.Images.TabBar.info,
                                                           tag: Tabs.info.rawValue)
        
        setViewControllers([habitNavigationController, infoNavigationController], animated: false)
    }
}
