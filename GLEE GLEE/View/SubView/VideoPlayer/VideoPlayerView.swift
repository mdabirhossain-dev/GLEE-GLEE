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
    @EnvironmentObject var dataVM: DataVM
    @State private var player = AVPlayer()
    let url = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
    let categories = ["Sports", "News", "Entertainment", "Local TV"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollViewReader { value in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VideoPlayer(player: player)
                            .frame(width: geo.size.width)
                            .aspectRatio(16 / 9, contentMode: .fit)
                            .onAppear {
                                player = AVPlayer(url:  URL(string: url)!)
                                player.play()
                            }
                        
                        HStack {
                            Image("desh_tv")
                                .resizable()
                                .frame(width: 80, height: 60)
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Desh TV")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                print("Like button tapped under player...")
                            }, label: {
                                Image(systemName: "heart")
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .clipShape(Circle())
                            })
                            
                            Button(action: {
                                print("Share button tapped under player...")
                            }, label: {
                                Image(systemName: "arrowshape.turn.up.right")
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .clipShape(Circle())
                            })
                        }
                        .padding(10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<categories.count, id: \.self) { index in
                                    Button {
                                        value.scrollTo(index, anchor: .top)
                                        print("Pressed from TV list")
                                    } label: {
                                        Text(categories[index])
                                            .padding(5)
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(.white, lineWidth: 2)
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        Group {
                            TVCategoryView(tvDataModel: dataVM.tvChannelData.sperts, size: geo.size)
                                .id(0)
                            
                            TVCategoryView(tvDataModel: dataVM.tvChannelData.news, size: geo.size)
                                .id(1)
                            
                            TVCategoryView(tvDataModel: dataVM.tvChannelData.entertainment, size: geo.size)
                                .id(2)
                            
                            TVCategoryView(tvDataModel: dataVM.tvChannelData.localTV, size: geo.size)
                                .id(3)
                        }
                        .padding([.horizontal, .bottom], 10)
                    }
                }
            }
        }
        .background(Color.black)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
