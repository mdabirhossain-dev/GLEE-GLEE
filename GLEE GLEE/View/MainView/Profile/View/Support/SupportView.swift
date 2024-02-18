//
//  SupportView.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import SwiftUI

struct SupportView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var mobileNumberText: String = ""
    @State private var enterSubjectText: String = ""
    @State private var addDescriptionText: String = ""
    @State private var isAlert: Bool = false
    var body: some View {
        ZStack {
            Color(UIColor.appPrimaryBackground ?? .systemBackground)
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        Text("Get In Touch")
                            .font(.custom(FontManager.Poppins.bold, size: 14))
                            .padding(.top)
                        
                        LargeTextFieldVModifier(title: "Enter your mobile number", font: FontManager.Poppins.regular) {
                            TextField("", text: $mobileNumberText)
                                .keyboardType(.phonePad)
                                .textContentType(.telephoneNumber)
                                .placeholderWithCustomColor(when: mobileNumberText.isEmpty,alignment: .leading, placeholder: {
                                    Text("Enter your mobile number")
                                        .foregroundColor(.primary.opacity(0.8))
                                        .font(.custom("Poppins-Regular", size: 12))
                                })
                        }.padding()
                        
                        LargeTextFieldVModifier(title: "Enter Subject", font: FontManager.Poppins.regular) {
                            TextField("", text: $enterSubjectText)
                                .placeholderWithCustomColor(when: enterSubjectText.isEmpty,alignment: .leading, placeholder: {
                                    Text("Enter Subject")
                                        .foregroundColor(.primary.opacity(0.8))
                                        .font(.custom("Poppins-Regular", size: 12))
                                })
                        }.padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Add Description")
                                .foregroundColor(.primary)
                                .font(.custom("Poppins-Regular", size: 14))
                            
                            MultilineTextFieldWithRoundedBorder(title: "", textFieldPlaceholder: "Write a description.........", height: 139, fieldBorderLineWidth: 1, fieldText: $addDescriptionText)
                                .frame(height: 140)
                        }
                        .padding()
                        
                        Button{
                            withAnimation{ 
                                isAlert = true
                            }
                        } label: {
                            Text("Submit")
                                .font(Font.custom("Montserrat", size: 18).weight(.bold))
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
                        
                    }.padding(.bottom, 100)
                }
            }
            
            ProfileCustomAlert(isActive: $isAlert, title: "E-mail Sent", navBackWhenHaveToClose: false) {
                Text("Your email is successfully sent \nsomeone from our support team will\n soon contact you. ")
                    .fontWeight(.bold)
            }
        }
        .onTapGesture(perform: {
            hideKeyboard()
        })
        .profileNavigationToolbar(title: "Support", isTitle: true, isSearch: true, isNotification: true)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
    private func isEmptyField() -> Bool {
        if !mobileNumberText.isEmpty && !enterSubjectText.isEmpty && !addDescriptionText.isEmpty {
            return false
        }
        return true
        
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
