//
//  PopularTVChannelView.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import SwiftUI

struct PopularTVChannelView: View {
    // MARK: - Properties
    @EnvironmentObject var homeDataVM: DataVM
    
//    var action: () -> Void
    
    let popularVTChannels: [PopularTVChannel]
    let size: CGSize
    
    var body: some View {
        Text("Popular TV Channels")
            .bold()
            .padding(.leading, 5)
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 15) {
                ForEach(0..<popularVTChannels.count, id: \.self) { index in
                    Button {
//                        action()
                        withAnimation {
                            homeDataVM.isPresentPlayer = true
                        }
                    } label: {
                        Image(popularVTChannels[index].thumbnail)
                            .resizable()
                            .frame(maxWidth: 0.15 * size.height, maxHeight: 0.15 * size.height)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 0.15 * size.height)
            .aspectRatio(contentMode: .fill)
        }
    }
}

struct PopularTVChannelView_Previews: PreviewProvider {
    static var previews: some View {
        PopularTVChannelView(popularVTChannels: [], size: CGSize(width: 0, height: 0))
    }
}
