//
//  SecondaryButton.swift
//  MyHabits
//
//  Created by temaathletic on 20.11.2022.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addViews()
        layoutView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SecondaryButton {

    func addViews() {
        addSubview(iconView)
    }
    
    func layoutView() {
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 25),
            iconView.widthAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
    func setupView() {
        makeSystem(self)
        
        iconView.image = UIImage(systemName: "plus.circle.fill")
        iconView.tintColor = Resources.Colors.active
        iconView.translatesAutoresizingMaskIntoConstraints = false
    }
}
