//
//  ShowInfos.swift
//  OTT App
//
//  Created by Md Abir Hossain on 04-09-2023.
//

import Foundation
    import SwiftUI


struct ShowInfos: Identifiable {
    let id = UUID()
    let showThumbnail: String
    let showTitle: String
    let rating: Double
    let yearOfRelease: Int
    
}


let showInfos: [ShowInfos] = [
    ShowInfos(showThumbnail: "img0", showTitle: "Satya Prem Ki Katha", rating: 8.5, yearOfRelease: 2023), ShowInfos(showThumbnail: "img1", showTitle: "Kisi Ka Bhai Kisi Ki Jaan", rating: 5.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img2", showTitle: "Sholey", rating: 6.7, yearOfRelease: 2021), ShowInfos(showThumbnail: "img3", showTitle: "Chhorii", rating: 7.3, yearOfRelease: 2023), ShowInfos(showThumbnail: "img4", showTitle: "Antim", rating: 7.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img5", showTitle: "Beimaan Pitega 2", rating: 5.5, yearOfRelease: 2021), ShowInfos(showThumbnail: "img0", showTitle: "Satya Prem Ki Katha1", rating: 8.5, yearOfRelease: 2023), ShowInfos(showThumbnail: "img1", showTitle: "Kisi Ka Bhai Kisi Ki Jaan1", rating: 5.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img2", showTitle: "Sholey1", rating: 6.7, yearOfRelease: 2021), ShowInfos(showThumbnail: "img3", showTitle: "Chhorii1", rating: 7.3, yearOfRelease: 2023), ShowInfos(showThumbnail: "img4", showTitle: "Antim1", rating: 7.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img5", showTitle: "Beimaan Pitega 21", rating: 5.5, yearOfRelease: 2021), ShowInfos(showThumbnail: "img0", showTitle: "Satya Prem Ki Katha2", rating: 8.5, yearOfRelease: 2023), ShowInfos(showThumbnail: "img1", showTitle: "Kisi Ka Bhai Kisi Ki Jaan2", rating: 5.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img2", showTitle: "Sholey2", rating: 6.7, yearOfRelease: 2021), ShowInfos(showThumbnail: "img3", showTitle: "Chhorii2", rating: 7.3, yearOfRelease: 2023), ShowInfos(showThumbnail: "img4", showTitle: "Antim2", rating: 7.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img5", showTitle: "Beimaan Pitega 22", rating: 5.5, yearOfRelease: 2021), ShowInfos(showThumbnail: "img5", showTitle: "C id", rating: 5.5, yearOfRelease: 2021)
]


let recommendedShows: [ShowInfos] = [
    ShowInfos(showThumbnail: "img0", showTitle: "Satyaprem Ki Katha", rating: 8.5, yearOfRelease: 2023), ShowInfos(showThumbnail: "img1", showTitle: "Kisi Ka Bhai Kisi Ki Jaan", rating: 5.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img2", showTitle: "Sholey", rating: 6.7, yearOfRelease: 2021), ShowInfos(showThumbnail: "img3", showTitle: "Chhorii", rating: 7.3, yearOfRelease: 2023), ShowInfos(showThumbnail: "img4", showTitle: "Antim", rating: 7.9, yearOfRelease: 2022), ShowInfos(showThumbnail: "img5", showTitle: "Beimaan Pitega 2", rating: 5.5, yearOfRelease: 2021)
]



// Search history
var searchHistory: [String] = []

// Add to search history
public func addRecent(recent: String) {
    if recent.count > 2 && !searchHistory.contains(recent) {
        if searchHistory.count >= 5 {
            searchHistory.removeLast()
        }
        searchHistory.insert(recent, at: 0)
    }
}
