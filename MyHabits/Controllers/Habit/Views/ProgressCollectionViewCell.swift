//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Все получится!"
        label.font = Resources.Fonts.sfProDisplayBold(with: 13)
        label.textColor = .systemGray
        return label
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = Resources.Fonts.sfProDisplayBold(with: 13)
        label.textColor = .systemGray
        return label
    }()
    
    private var progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.trackTintColor = .systemGray
        progress.progressTintColor = UIColor.purple
        progress.clipsToBounds = true
        progress.layer.cornerRadius = 3.5
        return progress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupProgressBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(textLabel)
        addSubview(progressLabel)
        addSubview(progressBar)
        
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(12)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(12)
        }
        
        progressBar.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(7)
        }
    }
    
    func setupProgressBar(){
        progressLabel.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
        progressBar.progress = HabitsStore.shared.todayProgress
    }
}



