//
//  VideoPlayerView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - Properties
    @EnvironmentObject var homeDataVM: DataVM
    @State private var player = AVPlayer()
    let url = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
    var body: some View {
        GeometryReader { geo in
            VideoPlayer(player: player)
//                .frame(width: geo.size.height * 16 / 9, height: geo.size.height)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                .onAppear {
                    player = AVPlayer(url:  URL(string: url)!)
                    player.play()
                }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
