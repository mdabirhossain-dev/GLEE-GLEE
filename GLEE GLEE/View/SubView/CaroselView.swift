//
//  CaroselView.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import SwiftUI

struct CaroselView: View {
    // MARK: - Properties
    let carosel: [Carosel]
    let size: CGSize
    
    @State private var selection: Int = 0
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
//        let size = UIScreen.main.bounds.size.height
        VStack {
            TabView(selection: $selection) {
                ForEach(0 ..< carosel.count, id: \.self) { image in
                    Button(action: {
                        
                    }, label: {
                        Image(carosel[image].thumbnail)
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 0.35 * size.height)
                    })
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay (
                // Carosal Index
                HStack {
                    ForEach(0 ..< carosel.count, id: \.self) { circle in
                        Button(action: {
                            withAnimation {
                                selection = circle
                                print("Circle number \(circle)")
                            }
                        }, label: {
                            Circle()
                                .fill(circle == selection ? Color.pink : Color.white)
                                .frame(width: 7, height: 7)
                                .padding(6)
                        })
                    }
                }
                    .padding(10)
                , alignment: .bottomTrailing
            )
            .onReceive(timer) { _ in
                withAnimation {
                    // Changing carosal
                    if selection < carosel.count {
                        selection += 1
                    } else if selection == carosel.count {
                        selection = 0
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 0.35 * size.height)
        .aspectRatio(contentMode: .fill)
    }
}

struct CaroselView_Previews: PreviewProvider {
    static var previews: some View {
        CaroselView(carosel: [], size: CGSize(width: 0, height: 0))
    }
}
