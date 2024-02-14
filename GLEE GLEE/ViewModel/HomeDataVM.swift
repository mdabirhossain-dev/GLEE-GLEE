//
//  HomeDataVM.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import Foundation


class HomeDataVM: ObservableObject {
    
    static let shared = HomeDataVM()
    
    @Published var homeData = HomeDataModel(
        carosel: [
            Carosel(id: 0, title: "", thumbnail: "dirilis", backgroundImage: ""),
            Carosel(id: 1, title: "", thumbnail: "ontojal", backgroundImage: ""),
            Carosel(id: 2, title: "", thumbnail: "rishta", backgroundImage: ""),
            Carosel(id: 3, title: "", thumbnail: "ural_prem", backgroundImage: ""),
        ],
        popularTVChannel: [
            PopularTVChannel(id: 0, title: "", thumbnail: "euro_sports", backgroundImage: ""),
            PopularTVChannel(id: 1, title: "", thumbnail: "nick", backgroundImage: ""),
            PopularTVChannel(id: 2, title: "", thumbnail: "shomoy", backgroundImage: ""),
            PopularTVChannel(id: 3, title: "", thumbnail: "sony_aath", backgroundImage: ""),
            PopularTVChannel(id: 4, title: "", thumbnail: "sony_sports1", backgroundImage: ""),
            PopularTVChannel(id: 5, title: "", thumbnail: "sony_sports2", backgroundImage: ""),
            PopularTVChannel(id: 6, title: "", thumbnail: "toffee_sports", backgroundImage: ""),
            PopularTVChannel(id: 7, title: "", thumbnail: "zee_bangla", backgroundImage: ""),
            PopularTVChannel(id: 0, title: "", thumbnail: "euro_sports", backgroundImage: ""),
            PopularTVChannel(id: 1, title: "", thumbnail: "nick", backgroundImage: ""),
            PopularTVChannel(id: 2, title: "", thumbnail: "shomoy", backgroundImage: ""),
            PopularTVChannel(id: 3, title: "", thumbnail: "sony_aath", backgroundImage: ""),
            PopularTVChannel(id: 4, title: "", thumbnail: "sony_sports1", backgroundImage: ""),
            PopularTVChannel(id: 5, title: "", thumbnail: "sony_sports2", backgroundImage: ""),
            PopularTVChannel(id: 6, title: "", thumbnail: "toffee_sports", backgroundImage: ""),
            PopularTVChannel(id: 7, title: "", thumbnail: "zee_bangla", backgroundImage: ""),
        ],
        categories: [
            
        ],
        tidBits: [
            
        ],
        trendingChannels: [
            
        ]
    )
    
}
