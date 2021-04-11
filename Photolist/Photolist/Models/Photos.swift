//
//  Photos.swift
//  Photolist
//
//  Created by Sergey Sorokin on 11.04.2021.
//

import Foundation

struct Photos: Codable {
    var photos: PhotoArray
}

struct PhotoArray: Codable {
    var photo: [Photo]
}

struct Photo: Codable {
    var id: String
    var farm: Int
    var server: String
    var secret: String
}
