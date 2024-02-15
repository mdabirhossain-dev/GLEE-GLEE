//
//  EditorsChoiceView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 14/2/24.
//

import SwiftUI

struct EditorsChoiceView: View {
    // MARK: - Properties
    @EnvironmentObject var homeDataVM: HomeDataVM
    let editorsChoices: [EditorsChoice]
    
    @State private var isNavigate = false
    
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            Text("Editors Choice")
//                .bold()
//                .padding(.leading, 10)
//                .foregroundColor(Color.gray)
//                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVStack(spacing: 5) {
                Text("Editors Choice")
                    .bold()
                    .padding(.leading, 10)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<editorsChoices.count, id: \.self) { index in
                    Button {
//                        homeDataVM.isPresentPlayer = true
                        isNavigate = true
                    } label: {
                        EditorsChoiceCellView(editorsChoice: editorsChoices[index])
                    }
                    
//                    NavigationLink(destination: VideoPlayerView()) {
//                        EditorsChoiceCellView(editorsChoice: editorsChoices[index])
//                    }
                }
            }
//        }
        .padding(.vertical)
        .background(Color(red: 58/255, green: 80/255, blue: 115/255).opacity(0.8))
        .cornerRadius(20)
        .navigationDestination(isPresented: $isNavigate) {
            VideoPlayerView()
        }
    }
}

struct EditorsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        EditorsChoiceView(editorsChoices: [])
    }
}



struct EditorsChoiceCellView: View {
    // MARK: - Properties
    let editorsChoice: EditorsChoice
    
    var body: some View {
        let size = UIScreen.main.bounds.size
        
        if editorsChoice.id % 2 != 0 {
            HStack(spacing: 0) {
                Image(editorsChoice.thumbnail)
                    .resizable()
                    .frame(maxWidth: size.width / 2, maxHeight: 0.25 * size.height)
                    .aspectRatio(contentMode: .fill)
                
//                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(editorsChoice.title)
                            .bold()
                        
                        HStack {
                            Image("toffee")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                            
                            Text("Toffee")
                        }
                        
                        Text("3.4M Views・1m")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(Color.white)
                    .frame(maxWidth: size.width / 2, maxHeight: 0.25 * size.height, alignment: .trailing)
                    .padding(.trailing, 5)
                }
            }
        } else {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Text(editorsChoice.title)
                        .bold()
                    
                    HStack {
                        Image("toffee")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        Text("Toffee")
                    }
                    
                    Text("3.4M Views・1m")
                        .font(.system(size: 12, weight: .semibold))
                }
                .foregroundColor(Color.white)
                .frame(maxWidth: size.width / 2, maxHeight: 0.25 * size.height, alignment: .leading)
                .padding(.leading, 5)
                
                Image(editorsChoice.thumbnail)
                    .resizable()
                    .frame(maxWidth: size.width / 2, maxHeight: 0.25 * size.height)
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

struct EditorsChoiceCellView_Previews: PreviewProvider {
    static var previews: some View {
        EditorsChoiceCellView(editorsChoice: EditorsChoice(id: 0, title: "Dhobong", thumbnail: "dirilis", backgroundImage: "", duration: 2, totalView: "3.5M"))
    }
}
