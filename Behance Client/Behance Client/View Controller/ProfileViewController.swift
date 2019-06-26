//
//  ProfileViewController.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class ProfileViewController: UIViewController {

    let disposeBag  = DisposeBag()
    var viewModel : ProfileViewModel!
    var container : ProfileViewDependencyContainer!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // View State changes
        subscribeViewState()

        // Screen changes, push/present is controlled here
        subscribeScreen()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
}

//MARK: COLLECTION DATASOURCE
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
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }
        
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
}

//MARK: COLLECTION DELEGATE
extension ProfileViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = viewModel.dataSource[indexPath.section][indexPath.row]
        
        if (item.view() is ProjectItemCell){
            
            let cell = item.view() as! ProjectItemCell
            
            if let model = cell.model {
                // Dispatch/Pus Project Screen
                container.reduxStore.dispatch(ProjectAction(project: model.project))
            }
        }
    }
}

//MARK: PRIVATE FUNC
extension ProfileViewController {
    
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
    
    // Screen changes, push/present is controlled here
    private func subscribeScreen(){
        viewModel.screen.subscribe(onNext:{ screen in
            
            switch screen{
            case .project(let projectViewState):
                
                let projectVC = self.container.makeProjectViewController(viewState: projectViewState)
                
                self.navigationController?.pushViewController(projectVC, animated: true)
                
            default :
                break
            }
            
        }).disposed(by: disposeBag)
    }
    
    private func subscribeViewState(){
        viewModel.viewState.subscribe(onNext:{ [weak self] viewState in
            
            self?.viewModel.setup(user: viewState.user)
            self?.viewModel.addProjects()
            
            self?.navigationItem.title  = viewState.user.firstName
            
            self?.setupCollectionView()
            
        }).disposed(by: disposeBag)
    }
}
