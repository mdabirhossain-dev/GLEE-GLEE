//
//  SearchResultView.swift
//  OTT App
//
//  Created by Md Abir Hossain on 04-09-2023.
//

import SwiftUI

struct SearchResultView: View {
    // MARK: - Properties
    let showInfo: ShowInfos
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(showInfo.showThumbnail)
                .resizable()
                .frame(height: height)
                .overlay(
                    HStack {
                        HStack(spacing: 2) {
                            Text("\(showInfo.rating, specifier: "%0.1f")")
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                        .padding(.horizontal, 3)
                        .font(.custom(FontManager.Poppins.medium, size: 9))
                        .background(Color.red.opacity(0.5))
                        .clipShape(
                            RoundedCorners(bottomRight: 5)
                        )
                        
                        Spacer()
                        
                        Text("\(showInfo.yearOfRelease)")
                            .padding(.horizontal, 3)
                            .font(.custom(FontManager.Poppins.medium, size: 9))
                            .foregroundColor(Color.white)
                            .background(Color.red.opacity(0.5))
                            .clipShape(
                                RoundedCorners(bottomLeft: 5)
                            )
                    }
                    , alignment: .top
                )
                .cornerRadius(5)
            
            // Title
            Text(showInfo.showTitle.uppercased())
                .font(.custom(FontManager.Poppins.medium, size: 9.5))
        }
        .foregroundColor(Color.primary)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

// MARK: - Preview
struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(showInfo: ShowInfos(showThumbnail: "", showTitle: "", rating: 1.2, yearOfRelease: 1), height: 1.0)
    }
}
