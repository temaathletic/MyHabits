//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

protocol HabitDetailsViewControllerForFirstSceneDelegate {
    func reloadAfterWatchDetails()
}

class HabitDetailsViewController: UIViewController {
    
    weak var firstViewController: HabitsViewController?
    weak var delegate: HabitsViewController?
    
    var indexPathCollection: IndexPath?
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .plain )
        table.backgroundColor = UIColor.white
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Header")
        table.register(TableActivitiesDetailsCell.self, forCellReuseIdentifier: "Default")
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 60
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if indexPathCollection != nil {
            setupNavigation(indexPathCollection!)
        }
    }
    
    //MARK: - Создание и настройка
    
    func setupNavigation(_ indexPathCollection: IndexPath){
        navigationItem.title = HabitsStore.shared.habits[indexPathCollection.row].name
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.black]

        let edit = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(goToEditMode))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        navigationItem.rightBarButtonItem = edit
    }
    
    @objc  func goToEditMode(){
        let viewNameToGo = HabitViewController()
        viewNameToGo.indexFromDetailView = indexPathCollection
        viewNameToGo.isEditing = true
        viewNameToGo.beginScene = firstViewController
        viewNameToGo.habitDetailsDelegate = self
        let goTo = UINavigationController(rootViewController: viewNameToGo)
        navigationController?.present(goTo, animated: true)
    }
    
    private func setupView(){
        view.addSubview(table)
        view.backgroundColor = .systemBackground
        
        table.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
}

//MARK: - Расширение, чтобы работать с таблицей

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Активность"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (indexPathCollection != nil) {
            // количество дат за все время работы приложения
            return HabitsStore.shared.dates.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath) as? TableActivitiesDetailsCell {
            cell.backgroundColor = .white
            cell.setupTextForCell(HabitsStore.shared.habits[indexPathCollection!.row], HabitsStore.shared.dates[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "someCell", for: indexPath)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HabitDetailsViewController: HabitDetailsViewControllerDelegate {
    func backToMainScene() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension HabitDetailsViewController: HabitsReturnDelegate {
    func backToInitViewController() {
        firstViewController?.reloadTaskCell()
    }
}


