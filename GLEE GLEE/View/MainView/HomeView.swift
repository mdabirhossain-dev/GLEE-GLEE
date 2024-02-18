//
//  HomeView.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
//    @StateObject var homeDatxaVM = HomeDataVM.shared
    @EnvironmentObject var homeDataVM: DataVM
    
    let carosel: [Carosel] = [
        Carosel(id: 0, title: "", thumbnail: "dirilis", backgroundImage: ""),
        Carosel(id: 1, title: "", thumbnail: "ontojal", backgroundImage: ""),
        Carosel(id: 2, title: "", thumbnail: "rishta", backgroundImage: ""),
        Carosel(id: 3, title: "", thumbnail: "ural_prem", backgroundImage: ""),
    ]
    
    @State private var caroselIndex: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    CaroselView(carosel: homeDataVM.homeData.carosel, size: size)
                    
                    PopularTVChannelView(popularVTChannels: homeDataVM.homeData.popularTVChannel, size: size)
                    
                    MoviesView(movies: homeDataVM.homeData.movies, size: size)
                    
                    CategoriesView(categories: homeDataVM.homeData.categories)
                    
                    EditorsChoiceView(editorsChoices: homeDataVM.homeData.editorsChoice)
                    
                    TidBitsView(tidBits: homeDataVM.homeData.tidBits)
                    
                    TrendingChannelsView(trendingChannels: homeDataVM.homeData.trendingChannels)
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.gray.opacity(0.3))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
