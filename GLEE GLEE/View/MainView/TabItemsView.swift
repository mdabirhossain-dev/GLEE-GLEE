//
//  TabItemsView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import SwiftUI

struct TabItemsView: View {
    // MARK: - Propoerties
    @EnvironmentObject var homeDataVM: HomeDataVM
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            TVView()
                .tabItem {
                    Label("TV", systemImage: "play.tv")
                }
            
            UploadView()
                .tabItem {
                    Label("Upload", systemImage: "plus.circle")
                        .tint(Color.pink)
                }
            
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "globe.desk")
                }
            
            MyChannelView()
                .tabItem {
                    Label("My Channel", systemImage: "person.crop.square")
                }
        }
        .fullScreenCover(isPresented: $homeDataVM.isPresentPlayer) {
            VStack {
                
//                #if os(iOS)
                if UIDevice.current.isIPhone {
                    Button {
                        homeDataVM.isPresentPlayer = false
                    } label: {
                        Image(systemName: "xmark")
                            .padding()
                            .font(.system(size: 18, weight: .heavy))
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
//                #endif
                VideoPlayerView()
            }
            .ignoresSafeArea(.all)
        }
    }
}

#if DEBUG
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemsView()
    }
}
#endif
