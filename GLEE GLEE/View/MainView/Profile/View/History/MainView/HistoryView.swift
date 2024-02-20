//
//  MyWishlistView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI

let columns = [
    GridItem(),
    GridItem(),
    GridItem()
]

//struct HistoryView: View {
//    
//    private func setupCustomPlayer(videoURL: String, videoSeek: Float, videoId: String) {
//        
//        guard let url = NSURL(string: videoURL ) else { return }
//        let viewController = PlayerDetailViewController.instantiate()
//        viewController.viewModel = .init(isTv: false, currentVideoURL: videoURL, videoID: videoId )
//        CustomPlayer.initCustomPlayer(url: url)
//        CustomPlayer.seekTime(seek: videoSeek)
//        CustomPlayer.isSeekApplayable(isSeek: true)
//        CustomPlayer.videoUniqueID(videoId)
//        CustomPlayer.showCustomPlayerView(viewController: viewController)
//    }
//    @StateObject var viewModel = HistoryViewModel()
//    @State private var historyDate: [HistoryDate] = []
//    var body: some View {
//        VStack{
//            if historyDate.isEmpty {
//                NoDataFoundView()
//            } else {
//                ScrollView(.vertical, showsIndicators: false) {
//                    LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
//                        ForEach(historyDate, id: \.self) { historyDate in
//                            
//                            Section {
//                                LazyVGrid(columns: columns, spacing: 10) {
//                                    ForEach((historyDate.hisotryOfDate?.allObjects as? [History] ?? []).reversed(), id: \.self){ history in
//                                        
//                                        MyHistoryItemView(title: history.videoTitle ?? "", thumbnailUrl: history.thumbnailURL ?? "", playingDuration: history.playingDuration , videoDuration: history.videoDuration)
//                                            .onTapGesture(perform: {
//                                                Log.info("My History index \(String(describing: index))")
//                                                if CustomPlayer.getPlayerViewController() != nil {
//                                                    guard let url = NSURL(string: history.videoURL ?? "") else { return }
//                                                    CustomPlayer.seekTime(seek: history.playingDuration)
//                                                    CustomPlayer.isSeekApplayable(isSeek: true)
//                                                    CustomPlayer.changeURL(url: url)
//                                                    CustomPlayer.videoUniqueID(history.videoID ?? "")
//                                                    CustomPlayer.expandView(expand: true)
//                                                    
//                                                } else {
//                                                    setupCustomPlayer(videoURL: history.videoURL ?? "", videoSeek: history.playingDuration, videoId: history.videoID ?? "")
//                                                }
//                                                let vc = PlayerDetailViewController.instantiate()
//                                                vc.viewModel = .init(isTv: false, currentVideoURL: history.videoURL ?? "", videoID: history.videoID ?? "")
//                                                
//                                                CustomPlayer.isLive(isLive: false)
//                                                CustomPlayer.add_ViewController(viewController: vc)
//                                            }
//                                                          
//                                            )
//                                    }
//                                }.padding(.bottom, 10)
//                                
//                            } header: {
//                                HStack {
//                                    if historyDate.date == Date().format(format: "d MMMM") {
//                                        Text("Today")
//                                            .font(.custom(FontManager.Poppins.medium, size: 16))
//                                    }else {
//                                        Text(historyDate.date ?? "Today")
//                                            .font(.custom(FontManager.Poppins.medium, size: 16))
//                                    }
//                                    Spacer()
//                                    Button{
//                                        Log.info("Clear History")
//                                        DispatchQueue.global(qos: .background).async{
//                                            viewModel.dataManager.delete(historyDate)
//                                            withAnimation {
//                                                self.historyDate = CoreDataManager.shared.fetch(HistoryDate.self).reversed()
//                                            }
//                                        }
//                                    }label: {
//                                        HStack {
//                                            Text("Clear History")
//                                            Image("trash.history")
//                                                .resizable()
//                                                .frame(width: 13, height: 15.8897)
//                                        }.foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
//                                            .font(.custom(FontManager.Poppins.regular, size: 14))
//                                    }
//                                }.padding(.vertical, 5)
//                                    .background(
//                                        Color(ColorString.appPrimaryBackground.rawValue)
//                                    )
//                            }
//                            
//                        }
//                    }.padding(.bottom, 75)
//                }
//            }
//            
//        }
//        .padding(.horizontal, 10)
//        .profileNavigationToolbar(title: "History", isTitle: true, isSearch: true, isNotification: true)
//        .navigationBarHidden(false)
//        .navigationBarBackButtonHidden(true)
//        .background(
//            Color(UIColor.appPrimaryBackground ?? .systemBackground).ignoresSafeArea(.all)
//        )
//        .onAppear {
//            DispatchQueue.global(qos: .background).async {
//                historyDate = CoreDataManager.shared.fetch(HistoryDate.self).reversed()
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//struct MyWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}

