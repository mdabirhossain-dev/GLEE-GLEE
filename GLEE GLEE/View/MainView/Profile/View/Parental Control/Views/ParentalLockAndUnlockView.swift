//
//  ParentalLockAndUnlockView.swift
//  AmberIT
//
//  Created by Tanvir Rahman on 20/11/23.
//

import SwiftUI

struct ParentalLockAndUnlockView: View {
    @State private var isLock2nd: Bool = false
    @State var text: String = ""
    @State private var lockPageNumber: Int = 4
    @State private var isShowOTPErrorMessage: Bool = false
    @State private var isAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var lockUnlockValues: String = "Lock"
    var body: some View {
        ZStack{
            Color(UIColor.appPrimaryBackground ?? .systemBackground)
                .ignoresSafeArea()
            VStack {

                Image("ParentalControlBackgroundImage")
                    .resizable()
                    .padding(.top, 55)
                    .overlay(
                        VStack(spacing: 60){
                            Image("parentalControlLargeIcon")
                                .resizable()
                                .frame(width: 111, height: 106, alignment: .center)
                            if lockUnlockValues == "Lock"{
                                ParentalLockViews(isAlert: $isAlert, alertTitle: $alertTitle, alertMessage: $alertMessage)
                            }else {
                                ParentalUnlockViews(isAlert: $isAlert, alertTitle: $alertTitle, alertMessage: $alertMessage)
                            }
                            
                            Spacer()
                        }
                    ).padding(.top)
            }
            ProfileCustomAlert(isActive: $isAlert, title: alertTitle, navBackWhenHaveToClose: true) {
                Text(alertMessage)
                    .fontWeight(.bold)
            }
        }.onAppear{
            if let str = UserDefaults.standard.string(forKey: "parentalControl") {
                lockUnlockValues = str
            }else {
                lockUnlockValues = "Lock"
            }
        }
        .onTapGesture(perform: {
            hideKeyboard()
        })
        .profileNavigationToolbar(title: "Parental \(lockUnlockValues)", isTitle: true, isSearch: true, isNotification: true)
        .navigationBarHidden(false)
    }
}

struct ParentalLockAndUnlockView_Previews: PreviewProvider {
    static var previews: some View {
        ParentalLockAndUnlockView()
    }
}
