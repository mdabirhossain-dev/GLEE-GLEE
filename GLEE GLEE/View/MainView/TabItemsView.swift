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
    
    // Device orientation
    @State private var deviceOrientation = UIDevice.current.orientation
    
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
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            if UIDevice.current.orientation.isLandscape {
                self.deviceOrientation = UIDevice.current.orientation
            } else {
                self.deviceOrientation = UIDevice.current.orientation
            }
            print("Device oR: \(deviceOrientation.rawValue)")
        }
        .fullScreenCover(isPresented: $homeDataVM.isPresentPlayer) {
            VStack {
                let pri = print("OrientationValue: \(UIDevice.current.orientation.rawValue)")
                let pri1 = print("isLandscape: \(deviceOrientation.isLandscape)")
                
//                #if os(iOS)
                if UIDevice.current.isIPhone && deviceOrientation.rawValue == 0 || deviceOrientation.rawValue == 1 {
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
                    .padding([.top, .leading], 15)
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
