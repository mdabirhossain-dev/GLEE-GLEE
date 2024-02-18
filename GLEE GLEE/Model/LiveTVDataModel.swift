//
//  LiveTVDataModel.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 18/2/24.
//

import Foundation


struct LiveTVDataModel {
    let sperts: TVDataModel
    let news: TVDataModel
    let entertainment: TVDataModel
    let localTV: TVDataModel
}

struct TVDataModel {
    let title: String
    let tvModel: [TVModel]
}

struct TVModel {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}
