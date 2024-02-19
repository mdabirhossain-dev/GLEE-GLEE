//
//  SearchView.swift
//  OTT App
//
//  Created by Md Abir Hossain on 03-09-2023.
//

import SwiftUI
import UIKit
import Speech

struct SearchView: View {
    // MARK: - Properties
    @State var text = ""
    
    @Environment(\.presentationMode) var presentation
    
    // Speech Recognition
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    // MARK: - Functions
    // Filter
    var filterShows: [ShowInfos] {
        if text.isEmpty {
            return showInfos
        } else if text.count > 2 {
            var str = text
            str = str[str.startIndex] == " " ? "" : str
            str = str.removeMultiWhitespace()
            
            return showInfos.filter { ($0.showTitle).localizedCaseInsensitiveContains(str)
            }
        } else {
            var str = text
            str = str[str.startIndex] == " " ? "" : str
            str = str.removeMultiWhitespace()
            return showInfos.filter { ($0.showTitle).localizedCaseInsensitiveContains(str)
            }
        }
    }
    
    private func setupCustomPlayer() {
        guard let url = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8") else { return }
        let viewController = PlayerDetailViewController.instantiate()
        viewController.viewModel = .init(isTv: false, currentVideoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
        CustomPlayer.initCustomPlayer(url: url)
        CustomPlayer.showCustomPlayerView(viewController: viewController)
    }
    
    //MARK: - Check Authorization Status
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                Search(text: $text, execute: { addRecent(recent: text) })
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    if text.removeMultiWhitespace().count < 3 {
                        VStack(alignment: .leading) {
                            // Recent
                            if searchHistory.count > 0 {
                                Section {
                                    HStack {
                                        Text("Recent")
                                            .font(.custom(FontManager.Montserrat.bold, size: 24))
                                            .foregroundColor(.primary)
                                        Spacer()
                                        
                                        Text("See All")
                                            .font(.custom(FontManager.Montserrat.light, size: 16))
                                            .foregroundColor(Color.red)
                                    }
                                    
                                    ForEach(0 ..< searchHistory.count, id: \.self) { index in
                                        HStack {
                                            Image("clock-rewind")
                                            
                                            Text(searchHistory[index])
                                                .foregroundColor(Color.primary)
                                        }
                                        .onTapGesture {
                                            text = searchHistory[index]
                                        }
                                    }
                                }
                            }
                            
                            // Top Searches
                            Section {
                                Text("Top Searches")
                                    .font(.custom(FontManager.Poppins.medium, size: 22))
                                    .onTapGesture(perform: {
                                        Log.info("Top Searches")
                                    })
                                    .foregroundColor(.primary)
                                
                                LazyVGrid(columns: columns, spacing: 5) {
                                    ForEach(0 ..< recommendedShows.count, id: \.self) { index in
                                        SearchResultView(showInfo: recommendedShows[index], height: geo.size.width / 2)
                                            .onTapGesture(perform: {
                                                Log.info("Top Searches index \(index)")
                                                hideKeyboard()
                                                
                                                if CustomPlayer.getPlayerViewController() != nil {
                                                    guard let url = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8") else { return }
                                                    CustomPlayer.changeURL(url: url)
                                                    CustomPlayer.expandView(expand: true)
                                                } else {
                                                    setupCustomPlayer()
                                                }
                                                hideKeyboard()
                                                let vc = PlayerDetailViewController.instantiate()
                                                vc.viewModel = .init(isTv: false, currentVideoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
                                                CustomPlayer.isLive(isLive: false)
                                                CustomPlayer.add_ViewController(viewController: vc)
                                            })
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 100)
                    } else {
                        VStack(alignment: .leading) {
                            Text("Results")
                                .font(.custom(FontManager.Poppins.medium, size: 22))
                                .foregroundColor(.primary)
                            if filterShows.count > 0 {
                                LazyVGrid(columns: columns, spacing: 5) {
                                    ForEach(0 ..< filterShows.count, id: \.self) { index in
                                        SearchResultView(showInfo: filterShows[index], height: geo.size.width / 2)
                                            .onTapGesture(perform: {
                                                Log.info("Result index \(index)")
                                                if CustomPlayer.getPlayerViewController() != nil {
                                                    guard let url = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8") else { return }
                                                    CustomPlayer.changeURL(url: url)
                                                    CustomPlayer.expandView(expand: true)
                                                } else {
                                                    setupCustomPlayer()
                                                }
                                                hideKeyboard()
                                                let vc = PlayerDetailViewController.instantiate()
                                                vc.viewModel = .init(isTv: false, currentVideoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
                                                CustomPlayer.isLive(isLive: false)
                                                CustomPlayer.add_ViewController(viewController: vc)
                                            })
                                    }
                                }
                            } else {
                                VStack(alignment: .leading, spacing: 5) {
                                    VStack {
                                        Image(systemName: "xmark.circle")
                                            .font(.system(size: 54, weight: .light))
                                            .foregroundColor(Color.red)
                                        
                                        Text("Sorry! No Results Found")
                                            .font(.custom(FontManager.Poppins.medium, size: 14))
                                            .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Recommended Shows")
                                            .font(.custom(FontManager.Poppins.medium, size: 22))
                                            .foregroundColor(.primary)
                                        LazyVGrid(columns: columns, spacing: 5) {
                                            ForEach(0 ..< recommendedShows.count, id: \.self) { index in
                                                SearchResultView(showInfo: recommendedShows[index], height: geo.size.width / 2)
                                                    .onTapGesture(perform: {
                                                        hideKeyboard()
                                                        Log.info("Recommended Shows index \(index)")
                                                        
                                                        if CustomPlayer.getPlayerViewController() != nil {
                                                            guard let url = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8") else { return }
                                                            CustomPlayer.changeURL(url: url)
                                                            CustomPlayer.expandView(expand: true)
                                                        } else {
                                                            setupCustomPlayer()
                                                        }
                                                        hideKeyboard()
                                                        let vc = PlayerDetailViewController.instantiate()
                                                        vc.viewModel = .init(isTv: false, currentVideoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
                                                        CustomPlayer.isLive(isLive: false)
                                                        CustomPlayer.add_ViewController(viewController: vc)
                                                    })
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 75)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .profileNavigationToolbar(title: "Search", isTitle: true, isSearch: false, isNotification: false)
        .background(
            Color(UIColor.appPrimaryBackground ?? .systemBackground).ignoresSafeArea(.all)
        )
        .onTapGesture {
            Log.info("hide keyboard")
            hideKeyboard()
        }.navigationBarHidden(false)
        .foregroundColor(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
