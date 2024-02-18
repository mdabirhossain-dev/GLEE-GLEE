//
//  ParentalUnlockViews.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 20/11/23.
//

import SwiftUI

struct ParentalUnlockViews: View {
    @State private var lockPageNumber: Int = 1
    @State private var pinNumber: String = ""
    @State private var mailAddress: String = ""
    @State private var verificationCode: String = ""
    @State private var isShowOTPErrorMessage: Bool = false
    @Binding var isAlert: Bool
    @Binding var alertTitle: String
    @Binding var alertMessage: String
    let userDefaults = UserDefaults.standard
    var body: some View {
        if lockPageNumber == 1 {
            VStack(spacing: 40){
                VStack(spacing: 10){
                    Text("Content Locked")
                        .font(.custom(FontManager.Poppins.bold, size: 16))
                    
                    Text("Will anyone under the age of 18 be watching restricted \n content?")
                        .font(.custom(FontManager.Poppins.semiBold, size: 12))
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Button{
                        withAnimation {
                            lockPageNumber = 2
                        }
                        
                    }label: {
                        ParentalControlRedButton(buttonTitle: "UNLOCK NOW")
                    }
                    Text("Click Lock Now to setup Personal PIN")
                        .font(.custom(FontManager.Poppins.semiBold, size: 12))
                        .bold()
                    
                }
            }.transition(.move(edge: .leading))
        }else if lockPageNumber == 2 {
            
            VStack(spacing: 30){
                VStack(spacing: 10){
                    Text("Set Your Parental Unlock PIN")
                        .font(.custom(FontManager.Poppins.bold, size: 16))
                }
                VStack {
                    ParentalLockTextField(placeholderText: "PIN", text: $pinNumber) {
                        TextField("", text: $pinNumber)
                            .keyboardType(.numberPad)
                    }
                    
                    Button{
                        withAnimation {
                            lockPageNumber = 3
                        }
                    }label: {
                        ParentalControlRedButton(buttonTitle: "CONFIRM", isDisabled: pinNumber.count < 4 ? true : false)
                    }.disabled(pinNumber.count < 4 ? true : false )
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            
            
        }else if lockPageNumber == 3 {
            VStack{
                VStack(spacing: 10){
                    Text("Set Your Parental Lock PIN")
                        .font(.custom(FontManager.Poppins.bold, size: 16))
                    if !isShowOTPErrorMessage {
                        Text("We have sent your code to your email address")
                            .font(.custom(FontManager.Poppins.semiBold, size: 12))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                    }
                }
                VStack {
                    ParentalLockTextField(placeholderText: "Enter your verification code ", text: $verificationCode) {
                        TextField("", text: $verificationCode)
                    }
                    if isShowOTPErrorMessage {
                        Text("PIN Verification Failed")
                            .font(.system(size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.91, green: 0.2, blue: 0.19))
                    }
                    Button{
                        withAnimation {
                            isAlert = true
                            alertTitle = "PARENTAL UNLOCK"
                            alertMessage = "Your PIN is successfully used to unlock \n restricted 18+ content"
                            userDefaults.setValue("Lock", forKey: "parentalControl")
                        }
                        
                    }label: {
                        ParentalControlRedButton(buttonTitle: "Complete", isDisabled: verificationCode.count < 6 ? true : false)
                    }.disabled(verificationCode.count < 6 ? true : false)
                    
                    HStack {
                        Text("Didn’t get the code?")
                            .font(.custom(FontManager.Poppins.medium, size: 14))
                            .font(.system(size: 14))
                        
                        Button{
                            
                        }label: {
                            Text("Resend")
                                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .background(
                                    Color(red: 0.43, green: 0.43, blue: 0.43)
                                        .cornerRadius(5)
                                )
                                .foregroundColor(Color(ColorString.appIconForeground.rawValue))
                        }
                    }
                }
            }.transition(.move(edge: .trailing))
        }
    }
}

struct ParentalUnlockViews_Previews: PreviewProvider {
    static var previews: some View {
        ParentalUnlockViews(isAlert: .constant(false), alertTitle: .constant(""), alertMessage: .constant(""))
    }
}


