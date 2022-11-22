//
//  HabitNavController.swift
//  MyHabits
//
//  Created by temaathletic on 20.11.2022.
//

import UIKit

final class HabitNavController: BaseView {
     
    private let addButton = SecondaryButton()
    private let textLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
    
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

extension HabitNavController {
    
    override func setupView() {
        super.setupView()
        
        textLabel.text = "Сегодня"
        textLabel.font = Resources.Fonts.avenirNextBold(with: 34)
        textLabel.textColor = .black
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.addTarget(self, action: #selector(), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = Resources.Colors.viewBackground
    }
    
    override func layoutView() {
        super.layoutView()
        
        NSLayoutConstraint.activate([
            
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 14),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 44),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            addButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    override func addViews() {
        super.addViews()
        
        addSubview(addButton)
        addSubview(textLabel)
    }
}

