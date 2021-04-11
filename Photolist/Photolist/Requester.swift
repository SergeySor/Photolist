//
//  Requester.swift
//  Photolist
//
//  Created by Sergey Sorokin on 11.04.2021.
//

import Foundation
import Alamofire

class Requester {
    private let allPhotos = "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=da9d38d3dee82ec8dda8bb0763bf5d9c&format=json&nojsoncallback=1"
    
    func getNewPhotos(completion: @escaping (Photos?)->()){
        
        let request = AF.request(allPhotos)
        
        request.responseJSON { (data) in
            if let data = data.data {
                let decoder = JSONDecoder()
                let photo = try? decoder.decode(Photos.self, from: data)
                completion(photo)
                print(photo ?? "value can't be deserilized")
            }
        }
    }
}
