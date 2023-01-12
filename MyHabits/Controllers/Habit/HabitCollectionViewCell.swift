//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    private lazy var taskName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.sizeToFit()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private lazy var repeatTime: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var counter: UILabel = {
        let label = UILabel()
        label.text = "Счётчик: 0"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        image.layer.cornerRadius = 10
        image.isUserInteractionEnabled = true
        return image
    }()
    
    @objc func imageTapped(){
        if HabitsStore.shared.habits[image.tag].isAlreadyTakenToday {
            // только принт сделаем, пользователю ничего не покажем
            print("Уже трекано")
        } else {
            HabitsStore.shared.track(HabitsStore.shared.habits[image.tag])
            updateImageOfTask(image.tag)
            updateCounterOfTask(image.tag)
            // слушатель как раз обновит прогресс-бар
            NotificationCenter.default.post(name: Notification.Name(rawValue: notificationKeyForCellUpdate), object: self)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(taskName)
        addSubview(repeatTime)
        addSubview(counter)
        addSubview(image)
        
        taskName.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(25)
        }
        
        repeatTime.snp.makeConstraints { make in
            make.top.equalTo(taskName.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(20)
        }
        
        counter.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(25)
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(36)
            make.right.equalToSuperview().inset(25)
        }
    }
    
    func setupCellForTask(_ index: Int){
        taskName.textColor = HabitsStore.shared.habits[index].color
        taskName.text = HabitsStore.shared.habits[index].name
        repeatTime.text = HabitsStore.shared.habits[index].dateString
        image.tag = index
        updateCounterOfTask(index)
        updateImageOfTask(index)
    }
    
    func updateCounterOfTask(_ index: Int) {
        counter.text = "Счётчик: \(String(HabitsStore.shared.habits[index].trackDates.count))"
    }
    
    func updateImageOfTask(_ index: Int){
        if HabitsStore.shared.habits[index].isAlreadyTakenToday {
            image.image = UIImage(systemName: "checkmark.circle.fill")
            image.tintColor = HabitsStore.shared.habits[index].color
        } else {
            image.image = UIImage(systemName: "circle")
            image.tintColor = HabitsStore.shared.habits[index].color
        }
    }
}


