//
//  HomeDataModel.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import Foundation


struct HomeDataModel {
    let carosel: [Carosel]
    let popularTVChannel: [PopularTVChannel]
    let categories: [Categories]
    let editorsChoice: [EditorsChoice]
    let tidBits: [TidBits]
    let trendingChannels: [TrendingChannels]
    let recentlyAdded: [RecentlyAdded]
    let movies: [Movie]
}

struct Carosel {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}

struct PopularTVChannel {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}

struct Categories {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}

struct EditorsChoice {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
    let duration: Int
    let totalView: String
}

struct TidBits {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}

struct TrendingChannels {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}

struct RecentlyAdded {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}

struct Movie {
    var id: Int
    let title: String
    let thumbnail: String
    let backgroundImage: String
}


// recently Added
// Recommended for You
// Top Movies
// Bollywood Movies
// Hollywood Movies
