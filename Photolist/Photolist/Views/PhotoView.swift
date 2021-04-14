//
//  PhotoView.swift
//  Photolist
//
//  Created by Sergey Sorokin on 14.04.2021.
//

import Foundation
import UIKit
import SnapKit

class PhotoView: UIView {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.square.fill"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        isOpaque = true
        
        addSubview(imageView)
        addSubview(backButton)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.right.equalTo(imageView.snp.right).offset(-5)
            make.top.equalTo(imageView.snp.top).offset(5)
        }
    }
}
