//
//  ProjectOwnersCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProjectOwnersCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var owners  : [User]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(name: "ProjectOwnerCell")
        
    }
    
    func configure(data: ProjectOwnersModel) {
        self.owners = data.owners
        
        collectionView.dataSource = self
        collectionView.delegate = self 
    }

}

extension ProjectOwnersCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.owners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let owner = self.owners[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectOwnerCell", for: indexPath) as! ProjectOwnerCell
        
        cell.configure(user: owner)
        
        return cell
        
    }
    
}

extension ProjectOwnersCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension ProjectOwnersCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let user    = self.owners[indexPath.row]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UserAction"), object: user)
        
    }
}
