//
//  DataVM.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import Foundation


class DataVM: ObservableObject {
    
    static let shared = DataVM()
    
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
            Movie(id: 0, title: "", thumbnail: "matrix", backgroundImage: ""),Movie(id: 0, title: "", thumbnail: "choori", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "morbius", backgroundImage: ""),
            Movie(id: 0, title: "", thumbnail: "beiman_pitega", backgroundImage: ""),Movie(id: 0, title: "", thumbnail: "happy_ending", backgroundImage: ""),Movie(id: 0, title: "", thumbnail: "beiman_pitega", backgroundImage: "")
        ]
    )
    
    @Published var tvChannelData = LiveTVDataModel(
        sperts: TVDataModel(title: "Sports", tvModel: [
            TVModel(id: 0, title: "Ligue 1", thumbnail: "ligue_1", backgroundImage: ""),
            TVModel(id: 1, title: "Sony Sports 1", thumbnail: "sony_sports_1", backgroundImage: ""),
            TVModel(id: 2, title: "Sony Sports 2", thumbnail: "sony_sports_2", backgroundImage: ""),
            TVModel(id: 3, title: "Sony Sports 3", thumbnail: "sony_sports_3", backgroundImage: ""),
            TVModel(id: 4, title: "Sony Sports 5", thumbnail: "sony_sports_5", backgroundImage: "")
        ]),
        news: TVDataModel(title: "News", tvModel: [
            TVModel(id: 0, title: "Al jazeera", thumbnail: "al_jazeera", backgroundImage: ""),
            TVModel(id: 1, title: "ATN Bangla 1", thumbnail: "atn_bangla 1", backgroundImage: ""),
            TVModel(id: 2, title: "ATN Bangla", thumbnail: "atn_bangla", backgroundImage: ""),
            TVModel(id: 3, title: "Bangla Vision", thumbnail: "bangla_vision", backgroundImage: ""),
            TVModel(id: 5, title: "Desh TV", thumbnail: "desh_tv", backgroundImage: ""),
            TVModel(id: 6, title: "DW", thumbnail: "dw", backgroundImage: ""),
            TVModel(id: 7, title: "Euro News", thumbnail: "euro_news", backgroundImage: ""),
            TVModel(id: 8, title: "Jamuna TV", thumbnail: "jamuna_tv", backgroundImage: ""),
            TVModel(id: 9, title: "Nagorik", thumbnail: "nagorik", backgroundImage: ""),
            TVModel(id: 10, title: "News 24", thumbnail: "news_24", backgroundImage: ""),
            TVModel(id: 11, title: "Ruposhi Bangla", thumbnail: "ruposhi_bangla", backgroundImage: "")
        ]),
        entertainment: TVDataModel(title: "Entertainment", tvModel: [
            TVModel(id: 0, title: "Euro News", thumbnail: "euro_news", backgroundImage: ""),
            TVModel(id: 1, title: "Al jazeera", thumbnail: "al_jazeera", backgroundImage: ""),
            TVModel(id: 2, title: "Ruposhi Bangla", thumbnail: "ruposhi_bangla", backgroundImage: ""),
            TVModel(id: 3, title: "ATN Bangla", thumbnail: "atn_bangla", backgroundImage: ""),
            TVModel(id: 4, title: "Nagorik", thumbnail: "nagorik", backgroundImage: ""),
            TVModel(id: 5, title: "Bangla Vision", thumbnail: "bangla_vision", backgroundImage: ""),
            TVModel(id: 6, title: "Jamuna TV", thumbnail: "jamuna_tv", backgroundImage: ""),
            TVModel(id: 7, title: "Boisakhi TV", thumbnail: "boisakhi_tv", backgroundImage: ""),
            TVModel(id: 8, title: "Desh TV", thumbnail: "desh_tv", backgroundImage: ""),
            TVModel(id: 9, title: "DW", thumbnail: "dw", backgroundImage: "")
        ]),
        localTV: TVDataModel(title: "Local TV", tvModel: [
            TVModel(id: 0, title: "ATN Bangla", thumbnail: "atn_bangla", backgroundImage: ""),
            TVModel(id: 1, title: "Euro News", thumbnail: "euro_news", backgroundImage: ""),
            TVModel(id: 2, title: "ATN Bangla 1", thumbnail: "atn_bangla 1", backgroundImage: ""),
            TVModel(id: 3, title: "Boisakhi TV", thumbnail: "boisakhi_tv", backgroundImage: ""),
            TVModel(id: 4, title: "Desh TV", thumbnail: "desh_tv", backgroundImage: ""),
            TVModel(id: 5, title: "Jamuna TV", thumbnail: "jamuna_tv", backgroundImage: ""),
            TVModel(id: 6, title: "DW", thumbnail: "dw", backgroundImage: ""),
            TVModel(id: 7, title: "Nagorik", thumbnail: "nagorik", backgroundImage: ""),
            TVModel(id: 8, title: "Bangla Vision", thumbnail: "bangla_vision", backgroundImage: ""),
            TVModel(id: 9, title: "News 24", thumbnail: "news_24", backgroundImage: ""),
            TVModel(id: 10, title: "Al jazeera", thumbnail: "al_jazeera", backgroundImage: ""),
            TVModel(id: 11, title: "Ruposhi Bangla", thumbnail: "ruposhi_bangla", backgroundImage: "")
        ])
    )
    
    @Published var isPresentPlayer = false
    @Published var videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
}
