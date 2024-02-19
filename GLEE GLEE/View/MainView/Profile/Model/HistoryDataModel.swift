//
//  MyWishList.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import Foundation


struct MyHistoryData {
    let historyId = UUID()
    let showTitle: String
    let thumbUrl: String
    let watchedDuration: Double
    let showDuration: String
}


let myHistory: [ String : [MyHistoryData] ] = [
    "Today" :
        [ MyHistoryData(showTitle: "Maya Shalik", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining"),
          MyHistoryData(showTitle: "Judas", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m  remaining"),
          MyHistoryData(showTitle: "The Silence", thumbUrl: "watchlist03", watchedDuration: 0.2, showDuration: "17m remaining"),
          MyHistoryData(showTitle: "Infinity", thumbUrl: "watchlist04", watchedDuration: 0.8, showDuration: "50m remaining"),
          MyHistoryData(showTitle: "Friday", thumbUrl: "watchlist05", watchedDuration: 0.4, showDuration: "2h 34m remaining"),
          MyHistoryData(showTitle: "Sholey", thumbUrl: "watchlist06", watchedDuration: 0.6, showDuration: "1h 20m remaining")
        ],
    "3rd November" : [
        MyHistoryData(showTitle: "Infinity war", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining"),
        MyHistoryData(showTitle: "Avengers 2012", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m remaining"),
        MyHistoryData(showTitle: "Hello Brother", thumbUrl: "watchlist03", watchedDuration: 0.2, showDuration: "17m remaining"),
        MyHistoryData(showTitle: "Sholey", thumbUrl: "watchlist06", watchedDuration: 0.6, showDuration: "1h 20m remaining")
    ],
    
    "27th November" : [
        MyHistoryData(showTitle: "Hitman", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining"),
        MyHistoryData(showTitle: "Matha Nosto", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m remaining"),
        MyHistoryData(showTitle: "Hello Brother", thumbUrl: "watchlist03", watchedDuration: 0.2, showDuration: "17m remaining"),
        MyHistoryData(showTitle: "Friday", thumbUrl: "watchlist05", watchedDuration: 0.4, showDuration: "2h 34m remaining"),
        MyHistoryData(showTitle: "Sholey", thumbUrl: "watchlist06", watchedDuration: 0.6, showDuration: "1h 20m remaining")
    ],
    "16th December" : [
        MyHistoryData(showTitle: "Barbie", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining"),
        MyHistoryData(showTitle: "Harry Potter", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m remaining"),
        MyHistoryData(showTitle: "Friday", thumbUrl: "watchlist03", watchedDuration: 0.2, showDuration: "17m remaining"),
        MyHistoryData(showTitle: "Mars", thumbUrl: "watchlist04", watchedDuration: 0.8, showDuration: "50m remaining"),
        MyHistoryData(showTitle: "Noting", thumbUrl: "watchlist05", watchedDuration: 0.4, showDuration: "2h 34m remaining"),
        MyHistoryData(showTitle: "Sholey", thumbUrl: "watchlist06", watchedDuration: 0.6, showDuration: "1h 20m remaining"),
        MyHistoryData(showTitle: "Maya Shalik", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining"),
        MyHistoryData(showTitle: "Harry Potter", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m remaining")
    ]
    
]
