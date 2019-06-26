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

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel   : ProjectViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate     = self 
        
        self.collectionView.register(name: "ProjectCoverImageCell")
        self.collectionView.register(name: "ProjectBasicInfoCell")
        self.collectionView.register(name: "ProjectFieldsCell")
        self.collectionView.register(name: "ProjectOwnersCell")
        
        let viewWillAppear      = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = ProjectViewModel.Input(trigger: Driver.merge(viewWillAppear))
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToProfile(notification:)), name: NSNotification.Name(rawValue: "UserAction"), object: nil)
        
        
    }
    
    @objc func goToProfile(notification: NSNotification) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "UserAction"), object: nil)
        
        let user = notification.object as! User
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let profileVC   = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
}

extension ProjectViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item    = viewModel.cellItems[indexPath.row]
        
        return item.size(ofCell: collectionView)
        
    }
    
    
}
