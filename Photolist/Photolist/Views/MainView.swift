//
//  MainView.swift
//  Photolist
//
//  Created by Sergey Sorokin on 03.04.2021.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collection.backgroundColor = .white
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = self.bounds
    }
}


