//
//  HabitViewController.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 0.94)
        setupRightBtn()
    }
    
    private func setupRightBtn() {
        
        let shopButton = createCustomButton(imageName: "plus", selector: #selector(rightBtn))
        
        navigationItem.rightBarButtonItem = shopButton
        navigationController?.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 0.94)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
    }
    
    @objc private func rightBtn() {
        let scene = ActionViewController()
        navigationController?.pushViewController(scene, animated: true)
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct InfoVCPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        HabitsViewController().toPreview()
    }
}
#endif
