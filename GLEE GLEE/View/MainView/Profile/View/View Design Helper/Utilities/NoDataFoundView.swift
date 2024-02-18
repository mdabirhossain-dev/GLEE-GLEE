//
//  NoDataFoundView.swift
//  GLEE GLEE
//
//  Created by Tanvir Rahman on 15/1/24.
//

import Foundation
import SwiftUI
import UIKit

struct NoDataFoundView: View {
    var body: some View {
        ZStack {
            DataNotFoundView()
        }
    }
}

struct DataNotFoundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return NotFoundErrorView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
}
