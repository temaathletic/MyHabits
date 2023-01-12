//
//  TableActivitiesDetailsCell.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

class TableActivitiesDetailsCell: UITableViewCell {
    
    private let textForCell: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14)
        title.textAlignment = .left
        title.textColor = .black
        title.text = ""
        return title
    }()
    
    private let imageCheck: UIImageView = {
        let image = UIImageView()
        image.tintColor = UIColor.purple
        image.image = UIImage(systemName: "checkmark")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(textForCell)
        contentView.addSubview(imageCheck)
        
        textForCell.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(11)
            make.left.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).inset(11)
        }
        
        imageCheck.snp.makeConstraints { make in
            make.centerY.equalTo(textForCell)
            make.right.equalTo(contentView).inset(14)
        }
    }
    
    func setupTextForCell(_ habit: Habit, _ data: Date){
        let textFormat = DateFormatter()
        textFormat.dateStyle = .long
        textForCell.text = textFormat.string(from: data)
        
        if HabitsStore.shared.habit(habit, isTrackedIn: data) {
            imageCheck.isHidden = false
        } else {
            imageCheck.isHidden = true
        }
    }
}

