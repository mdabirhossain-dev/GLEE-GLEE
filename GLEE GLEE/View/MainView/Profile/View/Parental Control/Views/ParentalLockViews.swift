//
//  ParentalLockViews.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 20/11/23.
//

import SwiftUI

struct ParentalLockViews: View {
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
                    Text("Lock Content with your personal PIN")
                        .font(.custom(FontManager.Poppins.bold, size: 16))
                        
                    
                    Text("Will anyone under the age of 18 be watching restricted \n content?")
                        .font(.custom(FontManager.Poppins.semiBold, size: 11))
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Button{
                        withAnimation {
                            lockPageNumber = 2
                        }
                        
                    }label: {
                        ParentalControlRedButton(buttonTitle: "LOCK NOW")
                    }
                    Text("Lock Content with your personal PIN")
                        .font(.custom(FontManager.Poppins.semiBold, size: 12))

                    
                }
            }.transition(.move(edge: .leading))
        }
        else if lockPageNumber == 2 {
            
            VStack(spacing: 30){
                VStack(spacing: 10){
                    Text("Lock Content with your personal PIN")
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
                    }.disabled(pinNumber.count < 4 ? true : false)
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            
        } else if lockPageNumber == 3 {
            VStack {
                Text("Enter Your Email Address")
                    .font(.custom(FontManager.Poppins.bold, size: 16))
                
                LargeTextFieldVModifier(title: "Enter E-Mail address", font: FontManager.Poppins.regular) {
                    TextField("", text: $mailAddress)
                        .placeholderWithCustomColor(when: mailAddress.isEmpty,alignment: .leading, placeholder: {
                            Text("Type Here")
                                .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground).opacity(0.8))
                                .font(.custom(FontManager.Poppins.light, size: 12))
                        })
                        .keyboardType(.emailAddress)
                }
                .padding()
                .padding(.bottom, 5)
                
                Button{
                    withAnimation {
                        lockPageNumber = 4
                    }
                } label: {
                    ParentalControlRedButton(buttonTitle: "Sent", isDisabled: mailAddress.count < 3 ? true : false)
                }.disabled(mailAddress.count < 3 ? true : false)
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            
        } else if lockPageNumber == 4 {
            VStack {
                VStack(spacing: 10) {
                    Text("Set Your Parental Lock PIN")
                        .font(.custom(FontManager.Poppins.bold, size: 16))
                    if !isShowOTPErrorMessage {
                        Text("We have sent your code to your email address")
                            .font(.custom(FontManager.Poppins.semiBold, size: 12))
                            .multilineTextAlignment(.center)
                    }
                }
                VStack {
                    ParentalLockTextField(placeholderText: "Enter your verification code ", text: $verificationCode) {
                        TextField("", text: $verificationCode)
                            .keyboardType(.emailAddress)
                    }
                    
                    if isShowOTPErrorMessage {
                        Text("PIN Verification Failed")
                            .font(.custom(FontManager.Poppins.regular, size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.91, green: 0.2, blue: 0.19))
                    }
                    
                    Button {
                        withAnimation {
                            alertTitle = "PARENTAL LOCK"
                            alertMessage = "Your PIN is successfully set to restrict 18+ \n contents access."
                            isAlert = true
                            userDefaults.setValue("Unlock", forKey: "parentalControl")
                        }
                    } label: {
                        ParentalControlRedButton(buttonTitle: "Complete", isDisabled: verificationCode.count < 6 ? true : false)
                    }.disabled(verificationCode.count < 6 ? true : false)
                    
                    HStack {
                        Text("Didn’t get the code?")
                            .font(.custom(FontManager.Poppins.regular, size: 14))
                        
                        Button{
                            
                        } label: {
                            Text("Resend")
                                .font(.custom(FontManager.Poppins.medium, size: 14))
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
            }
            .transition(.move(edge: .trailing))
        }
    }
}

struct ParentalLockViews_Previews: PreviewProvider {
    static var previews: some View {
        ParentalLockViews(isAlert: .constant(false), alertTitle: .constant(""), alertMessage: .constant(""))
    }
}
