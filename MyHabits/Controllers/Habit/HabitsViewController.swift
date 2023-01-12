//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by temaathletic on 12.01.2023.
//

import UIKit
import SnapKit

let notificationKeyForCellUpdate = "updateProgressBar"

protocol DelegateCollectionCellIndex {
    var indexPathCell: IndexPath { get set }
}

class HabitsViewController: UIViewController {
    var indexPathCell: DelegateCollectionCellIndex?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 18
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: "ProgressBar")
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: "CellForTask")
        collectionView.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateProgressBar), name: Notification.Name(rawValue: notificationKeyForCellUpdate), object: nil)
        setupView()
        setColorNC()
    }
    
    @objc func updateProgressBar(){
        collectionView.reloadData()
    }
    
    func setupView(){
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func addNewTask(){
        let viewNameToGo = HabitViewController()
        viewNameToGo.habitsMainSceneDelegate = self
        let goTo = UINavigationController(rootViewController: viewNameToGo)
        self.navigationController?.present(goTo, animated: true)
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {return 1} else {
            return HabitsStore.shared.habits.count
        }}
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressBar", for: indexPath) as? ProgressCollectionViewCell {
                cell.setupProgressBar()
                cell.layer.cornerRadius = 10
                cell.backgroundColor = .white
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Default", for: indexPath)
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForTask", for: indexPath) as? HabitCollectionViewCell {
                cell.layer.cornerRadius = 10
                cell.backgroundColor = .white
                cell.setupCellForTask(indexPath.row)
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Default", for: indexPath)
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section > 0 {
            collectionView.reloadData()
            let vc = HabitDetailsViewController()
            vc.firstViewController = self
            vc.indexPathCollection = indexPath
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let width = collectionView.frame.width - (1 - 1) * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / 1)
        
        if indexPath.section == 0 {
            return CGSize(width: itemWidth, height: 60)
        } else {
            return CGSize(width: itemWidth, height: 150)
        }
    }
    
    private func setColorNC() {
        let appearance = UINavigationBarAppearance()
        navigationItem.title = "Сегодня"
        let colorBackground = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 0.94)
        appearance.backgroundColor = colorBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.tintColor = .purple
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let info = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        
        info.tintColor = UIColor.purple
        
        navigationItem.rightBarButtonItem = info
    }
}

//MARK: - HabitViewControllerDelegate, HabitDetailsViewControllerForFirstSceneDelegate

extension HabitsViewController: HabitViewControllerDelegate {
    func reloadTaskCell() {
        collectionView.reloadData()
    }
}

extension HabitsViewController: HabitDetailsViewControllerForFirstSceneDelegate {
    func reloadAfterWatchDetails() {
        collectionView.reloadData()
    }
}
