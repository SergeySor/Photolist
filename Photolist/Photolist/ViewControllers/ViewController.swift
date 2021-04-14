//
//  ViewController.swift
//  Photolist
//
//  Created by Sergey Sorokin on 03.04.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private let identifier = "cell"
    private var requester = Requester()
    private var photos: Photos?
    
    private var mainView: MainView {
        return view as! MainView
    }
    
    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        requester.getNewPhotos(completion: setPhotos)
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        mainView.collectionView.register(CustomCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    func updateCollectionView(){
        mainView.collectionView.reloadData()
    }
    
    func setPhotos(photo: Photos?) {
        photos = photo
        updateCollectionView()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CustomCell
        if let photos = photos {
            let currentPhoto = photos.photos.photo[indexPath.item]
            
            let request = requester.getCurrentPhoto(photo: currentPhoto)
            
            request.responseData { (data) in
                if let data = data.data {
                    let image = UIImage(data: data)
                    cell.imageView.image = image
                    cell.updateConstraints()
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        
        if let image = cell.imageView.image {
            let photoViewController = PhotoViewController()
            photoViewController.modalPresentationStyle = .overCurrentContext
            photoViewController.setPhoto(photo: image)
            present(photoViewController, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.width * 0.35
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let interval = collectionView.frame.width * 0.1
        
        return UIEdgeInsets(top: 0, left: interval, bottom: 0, right: interval)
    }
    
}
