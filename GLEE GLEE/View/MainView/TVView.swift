//
//  TVView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import SwiftUI

struct TVView: View {
    // MARK: - Properties
    
    @EnvironmentObject var tvDataVM: DataVM
    
    let categories = ["Sports", "News", "Entertainment", "Local TV"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollViewReader { value in
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: false) {
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
                                        .foregroundColor(.primary)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(.white, lineWidth: 2)
                                        )
                                }
                            }
                        }
                        .padding(.leading, 10)
                    }
                    
                    Group {
                        TVCategoryView(tvDataModel: tvDataVM.tvChannelData.sperts, size: geo.size)
                            .id(0)
                        
                        TVCategoryView(tvDataModel: tvDataVM.tvChannelData.news, size: geo.size)
                            .id(1)
                        
                        TVCategoryView(tvDataModel: tvDataVM.tvChannelData.entertainment, size: geo.size)
                            .id(2)
                            
                        TVCategoryView(tvDataModel: tvDataVM.tvChannelData.localTV, size: geo.size)
                            .id(3)
                    }
                    .padding([.horizontal, .bottom], 10)
                }
            }
        }
    }
}

struct TVView_Previews: PreviewProvider {
    static var previews: some View {
        TVView()
    }
}




struct TVCategoryView: View {
    // MARK: - Properties
    
    @EnvironmentObject var tvDataVM: DataVM
    
    let tvDataModel: TVDataModel
    let size: CGSize
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            // Section Title
            Text(tvDataModel.title)
                .bold()
                .padding(.leading, 5)
                .foregroundColor(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Grid data
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0 ..< tvDataModel.tvModel.count, id: \.self) { index in
                    TVChannelCellView(image: tvDataModel.tvModel[index].thumbnail, size: size.width)
                        .onTapGesture {
                            tvDataVM.isPresentPlayer = true
                        }
                }
            }
        }
    }
}


struct TVChannelCellView: View {
    // MARK: - Properties
    
    let image: String
    let size: CGFloat
    
    var body: some View {
        // Cell Image
        Image(image)
//            .resizable()
//            .frame(height: size / 4)
//            .frame(maxWidth: .infinity)
            .aspectRatio(9/16, contentMode: .fill)
    }
}
