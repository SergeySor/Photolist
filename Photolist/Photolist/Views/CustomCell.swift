//
//  File.swift
//  Photolist
//
//  Created by Sergey Sorokin on 14.04.2021.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
    }
}
