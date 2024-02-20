//
//  NotificationViewController.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import UIKit

class NotificationViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout(section: compositionalLayout())
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.allowsMultipleSelection = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupViews()
    }
    
    private func compositionalLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78.0)))
        item.contentInsets = .init(top: 12.0, leading: 16.0, bottom: 0, trailing: 16.0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
//    private func setupViews() {
//        title = "Notification"
//        setupNavBar()
//        self.view.addSubview(collectionView)
//        collectionView.backgroundColor = .appPrimaryBackground
//        collectionView.dataSource = self
//        let bottomInset: CGFloat = 75.0
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
//        collectionView.registerNibCell(NotificationCollectionViewCell.self)
//        
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
    
    private func setupNavBar() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

//extension NotificationViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return notificationData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = NotificationCollectionViewCell.dequeue(from: collectionView, at: indexPath)
//        
//        let index = notificationData[indexChecked: indexPath.item]
//        let model = NotificationDataModel(image: index?.image ?? "",
//                                          title: index?.title ?? "",
//                                          subTitle: index?.subTitle ?? "",
//                                          date: index?.date ?? "",
//                                          isRead: index?.isRead ?? false)
//        cell.notificationModel = model
//        
//        cell.callback.didTappedRead = {[weak self] in
//            guard let self = self else { return }
//            
//            let indexPathToRead = indexPath.item
//            if indexPathToRead < notificationData.count {
//                notificationData[indexPathToRead].isRead = true
//                self.collectionView.reloadItems(at: [IndexPath(item: indexPathToRead, section: 0)])
//            } else {
//                Log.error("Index out of range \(indexPathToRead)")
//            }
//        }
//        
//        cell.callback.didTappedDelete = {[weak self] in
//            guard let self = self else { return }
//            
//            let indexPathToDelete = indexPath.item
//            if indexPathToDelete < notificationData.count {
//                notificationData.remove(at: indexPathToDelete)
//                
//                DispatchQueue.main.async {
//                    self.collectionView.performBatchUpdates({
//                        self.collectionView.deleteItems(at: [IndexPath(item: indexPathToDelete, section: 0)])
//                    }, completion: { _ in
//                        self.collectionView.reloadData()
//                    })
//                }
//            } else {
//                Log.error("Index out of range \(indexPathToDelete)")
//            }
//        }
//        return cell
//    }
//}

struct NotificationDataModel {
    let image: String
    let title: String
    let subTitle: String
    let date: String
    var isRead: Bool
}

var notificationData: [NotificationDataModel] = [
    NotificationDataModel(image: "v1", title: "Comming May 25", subTitle: "Play the Trailer", date: "25 May", isRead: false),
    NotificationDataModel(image: "v3", title: "Comming May 26", subTitle: "Play the Trailer", date: "25 May", isRead: false),
    NotificationDataModel(image: "v4", title: "Comming May 27", subTitle: "Play the Trailer", date: "25 May", isRead: false),
    NotificationDataModel(image: "v1", title: "Comming May 28", subTitle: "Play the Trailer", date: "25 May", isRead: false),
    NotificationDataModel(image: "v2", title: "Comming May 25", subTitle: "Play the Trailer", date: "25 May", isRead: false),
    NotificationDataModel(image: "v3", title: "Comming May 25", subTitle: "Play the Trailer", date: "25 May", isRead: false)
]
