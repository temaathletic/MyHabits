//
//  ViewController + Extensions.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import SwiftUI

extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        let viewControoller: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewControoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    func showPreview() -> some View {
        Preview(viewControoller: self).edgesIgnoringSafeArea(.all)
    }
}

extension UIViewController {
    
    func createCustomNavBar() {
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = #colorLiteral(red: 0.7004393935, green: 0.2260435522, blue: 0.8381720185, alpha: 1)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
