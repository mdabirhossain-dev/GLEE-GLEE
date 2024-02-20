//
//  movieRequestView.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 19/11/23.
//
import SwiftUI

struct MovieRequestView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var enterMovieName: String = ""
    @State private var addDescriptionText: String = ""
    @State private var isAlert: Bool = false
    var body: some View {
        ZStack {
            Color(UIColor.appPrimaryBackground ?? .systemBackground)
                .ignoresSafeArea()
            
            VStack {

                ScrollView {
                    VStack {
                        LargeTextFieldVModifier(title: "Enter Movie Name", font: FontManager.Poppins.regular) {
                            TextField("", text: $enterMovieName)
                                .placeholderWithCustomColor(when: enterMovieName.isEmpty,alignment: .leading, placeholder: {
                                    Text("Enter Movie Name")
                                        .foregroundColor(.primary.opacity(0.8))
                                        .font(.custom(FontManager.Poppins.light, size: 12))
                                })
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("Add Description")
                                .foregroundColor(.primary)
                                .font(.custom(FontManager.Poppins.regular, size: 14))
                            
                            MultilineTextFieldWithRoundedBorder(title: "", textFieldPlaceholder: "Write a description.........", height: 139, fieldBorderLineWidth: 1, fieldText: $addDescriptionText)
                                .frame(height: 140)
                        }
                        .padding()
                        
                        Button{
                            withAnimation {
                                isAlert = true
                            }
                        } label: {
                            Text("Submit")
                                .font(
                                    Font.custom("Montserrat", size: 18)
                                        .weight(.bold)
                                )
                                .padding(5)
                                .padding(.horizontal, 70)
                                .padding(10)
                                .foregroundColor(.white.opacity(isEmptyField() ? 0.7 : 1 ))
                                .background (
                                    Rectangle()
                                        .foregroundColor(Color(red: 0.88, green: 0.2, blue: 0.18).opacity(isEmptyField() ? 0.7 : 1 ))
                                        .cornerRadius(10)
                                )
                        }.padding(.top)
                            .disabled(isEmptyField() ? true : false)
                    }
                }
            }
            .profileNavigationToolbar(title: "Movie Request", isTitle: true, isSearch: true, isNotification: true)
            ProfileCustomAlert(isActive: $isAlert, title: "Movie Request Sent", navBackWhenHaveToClose: false) {
                Text("Your Movie request is successfully sent \n Thank you for stay with us.")
                    .fontWeight(.bold)
            }
        }
        .onTapGesture(perform: {
            hideKeyboard()
        })
        .navigationBarHidden(false)
    }
    private func isEmptyField() -> Bool {
        if !enterMovieName.isEmpty && !addDescriptionText.isEmpty {
            return false
        }
        
        return true
    }
}

// MARK: - Preview
struct MovieRequest_Preview: PreviewProvider {
    static var previews: some View {
        MovieRequestView()
    }
}
