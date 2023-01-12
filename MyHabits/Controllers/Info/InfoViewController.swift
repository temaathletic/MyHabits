//
//  InfoViewController.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    private let text: UILabel = {
        let label = UILabel()
        label.text = "Привычка за 21 день\n\nПрохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: \n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля.\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги – что оказалось тяжело, что – легче, с чем еще предстоит серьезно бороться.\n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств\n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой. \n\n6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.\n\n7. Психологи предостерегают людей, решивших следовать концепции, от самовольно назначенных себе «отпусков» между прохождением этапов. Доказано, что, даже отступив от установленных ограничений всего на 1 день, человек рискует уже не возвратиться к борьбе с плохими привычками и пустить дело на самотек.\n \nИсточник: psychbook.ru"
        label.numberOfLines = 0
        label.font = Resources.Fonts.sfProDisplayRegular(with: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Информация"
        setColorNC()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addArrangedSubview(text)
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(view.frame.width - 15)
            make.left.equalTo(scrollView).inset(15)
        }
    }
    
    private func setColorNC() {
        let appearance = UINavigationBarAppearance()
        let colorBackground = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 0.94)
        appearance.backgroundColor = colorBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}


