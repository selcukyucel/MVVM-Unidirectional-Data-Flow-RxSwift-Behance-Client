//
//  ProfileViewController.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit
import Foundation
class ProfileViewController: UIViewController {

    let viewModel = ProfileViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //TODO: create usecase to fetch
        if let user = getUser() {
            viewModel.user  = user
        }
        
        if let projects = getProjects(){
            viewModel.projects  = projects
        }
        //END TODO
        
        setupCollectionView()
        
    }
    
    private func setupCollectionView(){
        
        let layout = CustomCollectionViewLayout()
        
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        
        self.collectionView.register(name: "ProfileBasicInfoCell")
        self.collectionView.register(name: "AnyInfoCell")
        self.collectionView.register(name: "SocialCell")
        self.collectionView.register(name: "ProjectItemCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title   = viewModel.user?.firstName
    }

}

extension ProfileViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = viewModel.dataSource[indexPath.section][indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: item).reuseID, for: indexPath)
        
        item.configure(cell: cell)
        
        return cell
        
    }
    
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.section == 0 {
            let item = viewModel.dataSource[0][indexPath.row]
            
            return item.size(ofCell: collectionView)
        }
        let item = viewModel.dataSource[1][indexPath.row]
        
        return item.size(ofCell: collectionView)
//        return CGSize(width: collectionView.bounds.width , height: collectionView.bounds.width * 1.39)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }
        
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
}

extension ProfileViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = viewModel.dataSource[indexPath.section][indexPath.row]
        
        if type(of: item).reuseID == "ProjectItemCell" {
            print("pass")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ProjectViewController") as! ProjectViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}
