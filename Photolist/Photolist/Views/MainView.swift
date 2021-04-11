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
        let horizontalInsests = UIScreen.main.bounds.width / 10
        let itemSize = UIScreen.main.bounds.width * 0.35
        layout.sectionInset = UIEdgeInsets(top: 0, left: horizontalInsests, bottom: 0, right: horizontalInsests)
        layout.minimumInteritemSpacing = horizontalInsests
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        let collection = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collection.backgroundColor = .white
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
}

class CustomCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        needsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
