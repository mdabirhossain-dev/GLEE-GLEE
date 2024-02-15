//
//  MoviesView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 15/2/24.
//

import SwiftUI

struct MoviesView: View {
    // MARK: - Preview
    let movies: [Movie]
    let size: CGSize
    
    @EnvironmentObject var homeDataVM: HomeDataVM
    
    var body: some View {
        Text("Hindi Movies")
            .bold()
            .padding(.leading, 5)
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                ForEach(0..<movies.count, id: \.self) { index in
                    Button {
                        withAnimation {
                            homeDataVM.isPresentPlayer = true
                        }
                    } label: {
                        Image(movies[index].thumbnail)
                            .resizable()
                            .frame(maxWidth: 0.3 * size.height, maxHeight: 0.25 * size.height)
                    }
                }
            }
            .padding(.leading, 5)
            .frame(maxWidth: .infinity, maxHeight: 0.25 * size.height)
            .aspectRatio(contentMode: .fill)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(movies: [], size: CGSize(width: 0, height: 0))
    }
}


struct MovieCellView: View {
    // MARK: - Properties
    let movie: Movie
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(movie.thumbnail)
                .resizable()
                .frame(height: height)
                .overlay(
                    HStack {
                        HStack(spacing: 2) {
                            Text("\(4.5, specifier: "%0.1f")")
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                        .padding(.horizontal, 3)
                        .font(.system(size: 9))
                        .background(Color.red.opacity(0.5))
                        .clipShape(
                            RoundedCorners(bottomRight: 5)
                        )
                        
                        Spacer()
                        
                        Text("\(2021)")
                            .padding(.horizontal, 3)
                            .font(.system(size: 9))
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
            Text(movie.title.uppercased())
                .font(.system(size: 9.5))
        }
        .foregroundColor(Color.primary)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

// MARK: - Preview
struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: Movie(id: 0, title: "", thumbnail: "", backgroundImage: ""), height: 1.0)
    }
}
