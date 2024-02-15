//
//  TrensingChannelsView.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import SwiftUI

struct TrendingChannelsView: View {
    // MARK: - Properties
    let trendingChannels: [TrendingChannels]
    
    var body: some View {
        Text("TrendingChannelsView")
    }
}

struct TrensingChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingChannelsView(trendingChannels: [])
    }
}
