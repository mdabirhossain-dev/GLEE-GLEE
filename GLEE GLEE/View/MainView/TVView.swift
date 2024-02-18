//
//  TVView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import SwiftUI

struct TVView: View {
    // MARK: - Properties
    
    @EnvironmentObject var homeDataVM: HomeDataVM
    
    let categories = ["Sports", "Entertainment", "Local TV", "Kids"]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<categories.count, id: \.self) { index in
                        Button {
                            
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
            
            LazyVGrid(columns: columns) {
                ForEach(0..<18, id: \.self) { index in
                    Text("News")
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
