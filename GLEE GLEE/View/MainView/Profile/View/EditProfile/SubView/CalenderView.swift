//
//  CalenderView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import SwiftUI


struct DatePickerView: View {
    // MARK: - Properties
    @State private var date = Date()
    @Binding var dateString: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                DatePicker("", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .labelsHidden()
            }
            .onChange(of: date, perform: { value in
                dateString = dateFormatter(date: date)
                Log.info("Date: \(dateString)")
            })
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.85, green: 0.06, blue: 0.08), Color(red: 0.35, green: 0, blue: 0.01)]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(
                        LinearGradient(
                            colors: [Color(red: 0.92, green: 0.11, blue: 0.19), .white],
                            startPoint: .top,
                            endPoint: .bottom)
                        , lineWidth: 1.5)
            )
            .aspectRatio(contentMode: .fit)
        }
    }
}

// MARK: - Preview
struct DatePickerView_Previews: PreviewProvider {
    @State static var dateString = ""
    static var previews: some View {
        DatePickerView(dateString: $dateString)
    }
}
