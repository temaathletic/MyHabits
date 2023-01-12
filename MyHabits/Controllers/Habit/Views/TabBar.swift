//
//  TabBar.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: HabitsViewController(), titleView: NSLocalizedString("Привычки", comment: ""), image: UIImage(named: "habit_tab")!),
            createNavController(for: InfoViewController(), titleView: NSLocalizedString("Информация", comment: ""), image: UIImage(named: "info_tab")!),
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController, titleView: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = titleView
        navController.tabBarItem.image = image
        tabBar.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 0.8)
        tabBar.tintColor = #colorLiteral(red: 0.7004393935, green: 0.2260435522, blue: 0.8381720185, alpha: 1)
        let selectedColor = #colorLiteral(red: 0.7004393935, green: 0.2260435522, blue: 0.8381720185, alpha: 1)
        let unselectedColor = #colorLiteral(red: 0.6642269492, green: 0.6642268896, blue: 0.6642268896, alpha: 1)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        return navController
    }
}
