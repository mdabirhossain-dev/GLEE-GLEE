//
//  CategoriesView.swift
//  Multiplatform Stream
//
//  Created by Md Abir Hossain on 13/2/24.
//

import SwiftUI

struct CategoriesView: View {
    // MARK: - Properties
    let categories: [Categories]
    
    var body: some View {
        Text("CategoriesView")
    }
}

struct ategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: [])
    }
}
