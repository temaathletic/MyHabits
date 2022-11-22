//
//  InfoViewController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

class InfoViewController: BaseController {
    
    private lazy var textTitle: UILabel = {
        let text = UILabel()
        text.text = "Привычка за 21 день"
        text.font = Resources.Fonts.sfProDisplaySemibold(with: 20)
        text.textColor = .black
        text.textAlignment = .left
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: \n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля.\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги – что оказалось тяжело, что – легче, с чем еще предстоит серьезно бороться.\n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств\n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой. \n\n6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.\n\n7. Психологи предостерегают людей, решивших следовать концепции, от самовольно назначенных себе «отпусков» между прохождением этапов. Доказано, что, даже отступив от установленных ограничений всего на 1 день, человек рискует уже не возвратиться к борьбе с плохими привычками и пустить дело на самотек.\n \nИсточник: psychbook.ru"
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = Resources.Fonts.sfProDisplayRegular(with: 17)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        addViews()
        layoutView()
    }
}

extension InfoViewController {
    
    override func setupView() {
        super.setupView()
        
        title = "Информация"
        
    }
    
    override func addViews() {
        super.addViews()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textTitle)
        contentView.addSubview(text)
    }
    
    override func layoutView() {
        super.layoutView()
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10),
            
            textTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 22),
            textTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            textTitle.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16),
            
            text.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 16),
            text.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            text.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16),
            text.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
        ])
    }
}


