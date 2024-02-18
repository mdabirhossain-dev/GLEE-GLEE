//
//  ProgressView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI

struct ProgressViewSwiftUI: View {
    // MARK: - Properties
    let progressPercentasge: Double
    
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.secondary.opacity(0.8))
                    .frame(width: geo.size.width, height: 6/852 * geo.size.width)
                
                Rectangle()
                    .fill(Color.hotRed)
                    .frame(width: progressPercentasge * geo.size.width, height: 10/geo.size.height)
            }
        }
    }
}

    // MARK: - Preview
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewSwiftUI(progressPercentasge: 0.5)
    }
}
