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
//        popularTVChannel: [
//            PopularTVChannel(id: 0, title: "", thumbnail: "Bijoy-TV_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 1, title: "", thumbnail: "Channel-24_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 2, title: "", thumbnail: "CHANNEL-I-HD_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 3, title: "", thumbnail: "Desh-TV_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 4, title: "", thumbnail: "Ekattor-HD_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 5, title: "", thumbnail: "Independent-TV_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 6, title: "", thumbnail: "my-tv-HD_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 7, title: "", thumbnail: "NTV_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 0, title: "", thumbnail: "RTV-HD_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 1, title: "", thumbnail: "Somoy-News_110x110", backgroundImage: ""),
//            PopularTVChannel(id: 2, title: "", thumbnail: "Sony Ten 1 1", backgroundImage: ""),
//            PopularTVChannel(id: 3, title: "", thumbnail: "Sony Ten 2 1", backgroundImage: ""),
//            PopularTVChannel(id: 4, title: "", thumbnail: "Sony Ten 3 1", backgroundImage: ""),
//            PopularTVChannel(id: 5, title: "", thumbnail: "Sony Ten 5 1", backgroundImage: "")
//        ],
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
        editorsChoice: [
            EditorsChoice(id: 0, title: "Rishtqa", thumbnail: "rishta", backgroundImage: "", duration: 2, totalView: "2.5M"),
            EditorsChoice(id: 1, title: "Ontojal", thumbnail: "ontojal", backgroundImage: "", duration: 2, totalView: "1.5M"),
            EditorsChoice(id: 2, title: "Rishta", thumbnail: "rishta", backgroundImage: "", duration: 2, totalView: "3M"),
            EditorsChoice(id: 3, title: "Ural Prem", thumbnail: "ural_prem", backgroundImage: "", duration: 2, totalView: "2.5M"),
            EditorsChoice(id: 4, title: "Dirilis", thumbnail: "dirilis", backgroundImage: "", duration: 2, totalView: "4.5M"),
            EditorsChoice(id: 5, title: "Ontojal", thumbnail: "ontojal", backgroundImage: "", duration: 2, totalView: "5M"),
            EditorsChoice(id: 6, title: "Rishta", thumbnail: "rishta", backgroundImage: "", duration: 2, totalView: "2.5M"),
            EditorsChoice(id: 7, title: "Ural Prem", thumbnail: "ural_prem", backgroundImage: "", duration: 2, totalView: "7M")
        ],
        tidBits: [
            
        ],
        trendingChannels: [
            
        ],
        recentlyAdded: [
            
        ],
        movies: [
            Movie(id: 0, title: "", thumbnail: "antim", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "beiman_pitega", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "choori", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "dugdugi", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "happy_ending", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "matrix", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "morbius", backgroundImage: "")
        ]
    )
    @Published var isPresentPlayer = false
    @Published var videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
}
