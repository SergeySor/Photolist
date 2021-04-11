//
//  ViewController.swift
//  Photolist
//
//  Created by Sergey Sorokin on 03.04.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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

    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CustomCell
        if let photos = photos {
            let currentPhoto = photos.photos.photo[indexPath.item]
            let request = AF.request("https://farm\(currentPhoto.farm).staticflickr.com/\(currentPhoto.server)/\(currentPhoto.id)_\(currentPhoto.secret).jpg")
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

}

