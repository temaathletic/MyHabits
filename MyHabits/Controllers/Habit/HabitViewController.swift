//
//  HabitViewController.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

protocol HabitViewControllerDelegate {
    func reloadTaskCell()
}

protocol HabitDetailsViewControllerDelegate {
    func backToMainScene()
}

protocol HabitsReturnDelegate {
    func backToInitViewController()
}

class HabitViewController: UIViewController {
    
    weak var beginScene: HabitsViewController?
    weak var habitsMainSceneDelegate: HabitsViewController?
    weak var habitDetailsDelegate: HabitDetailsViewController?
    var indexFromDetailView: IndexPath?
    
    //MARK: - Создаем элементы, которые будем показывать
    
    private let titleText: UILabel = {
        let text = UILabel()
        text.text = "Название"
        text.font = Resources.Fonts.sfProDisplayRegular(with: 18)
        text.textColor = .black
        return text
    }()
    
    private var labelText: UITextField = {
        let label = UITextField()
        label.text = ""
        label.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        label.font = Resources.Fonts.sfProDisplayBold(with: 15)
        label.textColor = .systemBlue
        return label
    }()
    
    private let colorText: UILabel = {
        let text = UILabel()
        text.text = "Цвет"
        text.font = Resources.Fonts.sfProDisplayRegular(with: 16)
        text.textColor = .black
        return text
    }()
    
    private lazy var pickerColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.backgroundColor = UIColor.systemPink
        button.addTarget(self, action: #selector(goToPicker), for: .touchUpInside)
        return button
    }()
    
    @objc private func goToPicker(){
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.selectedColor = .systemBackground
        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true)
    }
    
    private let timeText: UILabel = {
        let text = UILabel()
        text.text = "Время"
        text.font = Resources.Fonts.sfProDisplayRegular(with: 16)
        text.textColor = .black
        return text
    }()
    
    private let everyTimeText: UILabel = {
        let text = UILabel()
        text.text = "Каждый день в"
        text.font = Resources.Fonts.sfProDisplayRegular(with: 16)
        text.textColor = .black
        return text
    }()
    
    private let timeValue: UILabel = {
        let text = UILabel()
        text.font = Resources.Fonts.sfProDisplayRegular(with: 16)
        text.textColor = UIColor.purple
        return text
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .time
        picker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        return picker
    }()
    
    @objc private func timeChanged(){
        let timeFormat = DateFormatter()
        timeFormat.timeStyle = .short
        timeValue.text = timeFormat.string(from: timePicker.date)
    }
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounces = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.isUserInteractionEnabled = true
        button.isHidden = false
        button.addTarget(self, action: #selector(tapForDelete), for: .touchUpInside)
        return button
    }()
    
    @objc func tapForDelete(){
        
        let alert = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку " + "'" + labelText.text! + "'?", preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Отменить", style: .cancel, handler: {_ in })
        let aprufAlert = UIAlertAction(title: "Удалить", style: .destructive) { (action) in
            
            HabitsStore.shared.habits.remove(at: self.indexFromDetailView!.row)
            self.updateViewControllerAfterOpenNewAddTask()
            self.dismiss(animated: true)
            self.habitDetailsDelegate?.backToMainScene()
        }
        
        alert.addAction(cancelAlert)
        alert.addAction(aprufAlert)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupDateForEditing()
    }
    
    func setupDateForEditing(){
        if isEditing == false {
            deleteButton.isHidden = true
        } else if isEditing == true {
            let symbols: [Character] = ["К", "а", "ж", "д", "ы", "й", "д", "е", "н", "ь", "в", " "]
            var time = HabitsStore.shared.habits[indexFromDetailView!.row].dateString
            time.removeAll(where: { symbols.contains($0) })
            
            navigationItem.title = "Править"
            labelText.text = HabitsStore.shared.habits[indexFromDetailView!.row].name
            pickerColorButton.backgroundColor = HabitsStore.shared.habits[indexFromDetailView!.row].color
            timeValue.text = time
            deleteButton.isHidden = false
        }
    }
    
    //MARK: - Задание и настройка
    
    func setupView(){
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(titleText)
        scrollView.addSubview(labelText)
        scrollView.addSubview(colorText)
        scrollView.addSubview(pickerColorButton)
        scrollView.addSubview(timeText)
        scrollView.addSubview(everyTimeText)
        scrollView.addSubview(timePicker)
        scrollView.addSubview(timeValue)
        scrollView.addSubview(deleteButton)
        
        
        scrollView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        titleText.snp.makeConstraints { make in
            make.top.equalTo(scrollView).inset(20)
            make.left.equalTo(scrollView).inset(10)
        }
        
        labelText.snp.makeConstraints { make in
            make.left.equalTo(scrollView).inset(10)
            make.top.equalTo(titleText.snp.bottom).offset(8)
        }
        
        colorText.snp.makeConstraints { make in
            make.top.equalTo(labelText.snp.bottom).offset(8)
            make.left.equalTo(scrollView).inset(10)
        }
        
        pickerColorButton.snp.makeConstraints { make in
            make.top.equalTo(colorText.snp.bottom).offset(8)
            make.left.equalTo(scrollView).inset(10)
            make.size.equalTo(30)
        }
        
        timeText.snp.makeConstraints { make in
            make.top.equalTo(pickerColorButton.snp.bottom).offset(8)
            make.left.equalTo(scrollView).inset(10)
        }
        
        everyTimeText.snp.makeConstraints { make in
            make.top.equalTo(timeText.snp.bottom).offset(8)
            make.left.equalTo(scrollView).inset(10)
        }
        
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(everyTimeText.snp.bottom).offset(8)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }
        
        timeValue.snp.makeConstraints { make in
            make.left.equalTo(everyTimeText.snp.right).offset(5)
            make.bottom.equalTo(everyTimeText)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Создать"
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let cancel = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(canselAddTask))
        let save = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveAddTask))
        
        cancel.tintColor = UIColor.purple
        save.tintColor = UIColor.purple
        
        navigationItem.rightBarButtonItem = save
        navigationItem.leftBarButtonItem = cancel
    }
    
    @objc private func canselAddTask(){
        updateViewControllerAfterOpenNewAddTask()
        dismiss(animated: true)
    }
    
    private func updateViewControllerAfterOpenNewAddTask(){
        beginScene?.reloadAfterWatchDetails()
        habitsMainSceneDelegate?.reloadTaskCell()
    }
    
    @objc private func saveAddTask(){
        if labelText.text?.isEmpty == true {
            let alert = UIAlertController(title: "Внимание!", message: "Не заполнено поле 'Название', сохранение данных невозможно", preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "Понятно", style: .default, handler: { _ in })
            alert.addAction(alertButton)
            present(alert, animated: true, completion: nil)
        } else { if isEditing == false {
            let newHabit = Habit(name: labelText.text!, date: timePicker.date, color: UIColor(cgColor: pickerColorButton.backgroundColor?.cgColor ?? CGColor(red: 1, green: 1, blue: 1, alpha: 1)))
            let store = HabitsStore.shared
            store.habits.append(newHabit)
            updateViewControllerAfterOpenNewAddTask()
            dismiss(animated: true)
        } else if isEditing == true {
            HabitsStore.shared.habits[indexFromDetailView!.row].name = labelText.text!
            HabitsStore.shared.habits[indexFromDetailView!.row].color = pickerColorButton.backgroundColor!
            HabitsStore.shared.habits[indexFromDetailView!.row].date = timePicker.date
            updateViewControllerAfterOpenNewAddTask()
            dismiss(animated: true)
            
            self.habitDetailsDelegate?.backToMainScene()
        }}
        updateViewControllerAfterOpenNewAddTask()
    }
}

//MARK: - UIColorPickerViewControllerDelegate

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let currentSelectedColor = viewController.selectedColor
        pickerColorButton.backgroundColor = currentSelectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let currentSelectedColor = viewController.selectedColor
        pickerColorButton.backgroundColor = currentSelectedColor
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct InfoVCPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        HabitViewController().toPreview()
    }
}
#endif
