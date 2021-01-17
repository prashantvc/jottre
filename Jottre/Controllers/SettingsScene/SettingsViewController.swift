//
//  SettingsViewController.swift
//  Jottre
//
//  Created by Anton Lorani on 17.01.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    var settings: Settings = Settings()
    
    
    
    // MARK: - Subviews
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 30, right: 0)
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .systemBackground
            collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: "settingsCell")
            collectionView.register(AppearanceSettingsCell.self, forCellWithReuseIdentifier: "appearanceSettingsCell")
            collectionView.register(CloudSettingsCell.self, forCellWithReuseIdentifier: "cloudSettingsCell")
        return collectionView
    }()
    
    var versionLabel: UILabel = {
        let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            label.textAlignment = .center
            label.text = "Version 0.9 Build 1"
            label.textColor = .secondaryLabel
        return label
    }()
    
    
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupDelegates()
        
    }
    
    
    
    // MARK: - Methods
    
    func setupViews() {
        
        navigationItem.title = "Settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.handleDone))
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(versionLabel)
        versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        versionLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        versionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
    }
    

    func setupDelegates() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    @objc func handleDone() {
        dismiss(animated: true, completion: nil)
    }
    
}