//
//  UIView + Extensions.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

extension UIView {
    
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
    
    func makeSystem(_ button: UIButton) {
        
        button.addTarget(self,
                         action: #selector(handelIn),
                         for: [
                            .touchDown,
                            .touchDragInside
                         ])
        
        
        button.addTarget(self,
                         action: #selector(handelOut),
                         for: [
                            .touchDragOutside,
                            .touchUpInside,
                            .touchUpOutside,
                            .touchDragExit,
                            .touchCancel
                         ])
    }
    
    @objc func handelIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc func handelOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
    
}
