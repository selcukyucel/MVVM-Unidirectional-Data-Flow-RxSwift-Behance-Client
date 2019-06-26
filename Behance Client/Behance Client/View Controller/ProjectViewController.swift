//
//  ProjectViewController.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ProjectViewController: UIViewController {

    var disposable  : Disposable!
    let disposeBag = DisposeBag()
    
    // UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // Model
    var viewModel   : ProjectViewModel!
    
    //Dependency
    var container   : ProjectDependencyContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register Cells
        registerCells()
        
        // Subscribe View State
        subscribeViewState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToProfile(notification:)), name: NSNotification.Name(rawValue: "UserAction"), object: nil)
        
        subscribeScreen()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.disposable.dispose()
    }
    
    @objc func goToProfile(notification: NSNotification) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "UserAction"), object: nil)
        
        let user = notification.object as! User
        
        // Push to Profile View
        container.reduxStore.dispatch(UserAction(user: user))
        
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ProjectViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item    = viewModel.cellItems[indexPath.row]
        
        return item.size(ofCell: collectionView)
        
    }
}

//MARK: Funcs
extension ProjectViewController {
    
    //MARK: Subscribe State
    private func subscribeViewState(){
        
        viewModel.viewState.subscribe(onNext:{ [weak self] viewState in
            self?.transform(project: viewState.project)
        }).disposed(by: disposeBag)
    }
    
    //MARK: Subscribe Screen
    private func subscribeScreen(){
        
        disposable = viewModel.screen.skip(1).subscribe(onNext:{ screen in
            switch screen {
            case .profile(let profileViewState):
                
                let profileVC = self.container.makeProfileViewController(viewState: profileViewState)
                
                self.navigationController?.pushViewController(profileVC, animated: true)
                
                break
                
            default:
                break
            }
        })
    }
    
    //MARK: Transform
    private func transform(project:Project){
        
        let viewWillAppear      = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = ProjectViewModel.Input(trigger: Driver.merge(viewWillAppear), project: project)
        
        let output = viewModel.transform(input: input)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, CellConfigurator>>(configureCell:{ (dataSource, cv, indexPath, element) in
            
            let cell = cv.dequeueReusableCell(withReuseIdentifier: type(of: element).reuseID, for: indexPath)
            
            element.configure(cell: cell)
            
            return cell
            
        })
        
        // Bind datasource to collection view
        output.datasource.drive(collectionView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        //Bind navigation bar title
        output.title.drive(self.navigationItem.rx.title).disposed(by: disposeBag)
    }
    
    private func registerCells(){
        collectionView.delegate     = self
        
        self.collectionView.register(name: "ProjectCoverImageCell")
        self.collectionView.register(name: "ProjectBasicInfoCell")
        self.collectionView.register(name: "ProjectFieldsCell")
        self.collectionView.register(name: "ProjectOwnersCell")
    }
}
