//
//  TidBitsView.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import SwiftUI

struct TidBitsView: View {
    // MARK: - Properties
    let tidBits: [TidBits]
    
    var body: some View {
        Text("TidBitsView")
    }
}

struct TidBitsView_Previews: PreviewProvider {
    static var previews: some View {
        TidBitsView(tidBits: [])
    }
}
