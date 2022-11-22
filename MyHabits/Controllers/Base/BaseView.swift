//
//  BaseView.swift
//  MyHabits
//
//  Created by temaathletic on 20.11.2022.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }  
}

@objc extension BaseView {
    
    func addViews() {}
    func layoutView() {}
    func setupView() {}
    
}
