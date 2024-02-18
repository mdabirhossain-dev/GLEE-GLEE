//
//  ProfileCustomAlert.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 21/11/23.
//

import Foundation
import SwiftUI

struct ProfileCustomAlert<AlertContentTextField: View>: View {
    
    @Binding var isActive: Bool
    var title: String
    @State var navBackWhenHaveToClose: Bool
    @ViewBuilder let content: AlertContentTextField
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if isActive {
            ZStack(alignment: .center){
                Color.black.opacity(0.8)
                    .onTapGesture {
                        withAnimation {
                            isActive = false
                        }
                        if navBackWhenHaveToClose {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                
                VStack(alignment: .center){
                    Image("successAlertIcon")
                        .resizable()
                        .frame(width: 42.6743, height: 37.436)
                        .padding(.bottom,10)
                    Text(title)
                        .font(.custom(FontManager.Poppins.hevay, size: 16))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                    content
                        .font(.custom(FontManager.Poppins.medium, size: 11))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    
                    Button{
                        withAnimation {
                            isActive = false
                        }
                        if navBackWhenHaveToClose {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }label: {
                        Text("OK")
                            .font(.custom(FontManager.Poppins.semiBold, size: 16))
                    }
                    .padding(3)
                    .padding(.horizontal, 25)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.top)
                    
                }
                .padding(.vertical, 10)
                .padding(10)
                .background(
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 1)
                            .background(
                                Color(red: 0.91, green: 0.2, blue: 0.19)
                                    .cornerRadius(15)
                            )
                    }
                )
                
            }
            .ignoresSafeArea(.all)
        }else {
            EmptyView()
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCustomAlert(isActive: .constant(true), title: "E-mail Sent", navBackWhenHaveToClose: true) {
            Text("Your email is successfully sent \nsomeone from our support team will\n soon contact you. ")
                .fontWeight(.bold)
        }
        
    }
}

