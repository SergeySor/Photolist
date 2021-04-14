//
//  PhotoViewController.swift
//  Photolist
//
//  Created by Sergey Sorokin on 14.04.2021.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController {
    
    private var mainView: PhotoView {
        return view as! PhotoView
    }
    
    private var photo: UIImage?
    
    override func loadView() {
        view = PhotoView()
    }
    
    func setPhoto(photo: UIImage) {
        self.photo = photo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.imageView.image = photo
        mainView.backButton.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
    }
}
