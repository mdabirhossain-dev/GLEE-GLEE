//
//  AppSettingsView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct AppSettingsView: View {
    // MARK: - Properties
    
 
    // Enter your Code
    @State private var enterCode: String = ""
    
    // SelectedLanguage
    @State private var selectedLanguage: String = "Select your language"
    
    // Data saver
    @State private var isDataSave: Bool = true
    @State private var isDark: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    VStack(alignment: .center, spacing: 25) {
                        // Title
                        HStack(spacing: 14) {
                            Image("connectToTV")
                                .resizable()
                                .frame(width: 27/392 * DeviceInfos().deviceWidth, height: 24.54/852 * DeviceInfos().deviceHeight)
                            
                            Text("Connect To TV")
                                .font(.custom(FontManager.Poppins.bold, size: 16))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .hideThisPartOfCode()
                        // QR Code
                        VStack {
                            Text("Scan QR code")
                                .font(.custom(FontManager.Poppins.semiBold, size: 16))
                            
                            Text("Place qr code inside the frame to scan please\navoid shake to get results quickly")
                                .font(.custom(FontManager.Poppins.medium, size: 12))
                                .multilineTextAlignment(.center)
                            
                            Image("qrCode")
                                .resizable()
                                .frame(width: 123.5/852 * DeviceInfos().deviceHeight, height: 122.5/852 * DeviceInfos().deviceHeight)
                            
                            Button {
                                
                            } label: {
                                Text("scan your QR code")
                                    .font(.custom(FontManager.Montserrat.light, size: 12))
                                    .foregroundColor(.white)
                                    .frame(width: 274/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                                    .background(Color.hotRed)
                            }
                            .cornerRadius(39)
                            
                            // Enter your code
                            ZStack(alignment: .center) {
                                Text(enterCode.isEmpty ? "Enter your code" : "")
                                
                                TextField("", text: $enterCode)
                                    .multilineTextAlignment(.center)
                            }
                            .foregroundColor(Color.white)
                            .frame(width: 184/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                            .padding(.horizontal, 15)
                            .font(.custom(FontManager.Montserrat.light, size: 12))
                            .background(Color.appSettingButtonBackgroundGray)
                            .cornerRadius(39)
                        }.hideThisPartOfCode()
                  
                        
                        // Data Saver Mode
                        VStack {
                            // Title
                            HStack(spacing: 14) {
                                Image("dataSaverMode")
                                    .resizable()
                                    .frame(width: 27/392 * DeviceInfos().deviceWidth, height: 24.54/852 * DeviceInfos().deviceHeight)
                                
                                Text("Data Saver Mode")
                                    .font(.custom(FontManager.Poppins.bold, size: 16))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(spacing: 11) {
                                Button {
                                    withAnimation {
                                        isDataSave = false
                                    }
                                } label: {
                                    Text("OFF")
                                        .font(.custom(FontManager.Poppins.bold, size: 12))
                                        .frame(width: frameSize(minSize: 62, dynamicSize: 61/392 * DeviceInfos().deviceWidth), height: frameSize(minSize: 32, dynamicSize: 32/852 * DeviceInfos().deviceHeight))
                                        .background(!isDataSave ? Color.hotRed : Color.appSettingButtonBackgroundGray)
                                }
                                .cornerRadius(39)
                                
                                Button {
                                    withAnimation {
                                        isDataSave = true
                                    }
                                } label: {
                                    Text("ON")
                                        .font(.custom(FontManager.Poppins.bold, size: 12))
                                        .frame(width: frameSize(minSize: 62, dynamicSize: 61/392 * DeviceInfos().deviceWidth), height: frameSize(minSize: 32, dynamicSize: 32/852 * DeviceInfos().deviceHeight))
                                        .background(isDataSave ? Color.hotRed : Color.appSettingButtonBackgroundGray)
                                }
                                .cornerRadius(39)
                            }
                            .foregroundColor(.white)
                        }.padding(.top, 30)
                        HStack {
                            CustomToggleButton(isToggle: $isDark)
                            
                            Text("Enable \(isDark ? "Light" : "Dark") Mode")
                                .font(.custom(FontManager.Poppins.bold, size: 16))
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.leading, 11)
                .foregroundColor(Color.primary)
            }
            
            Spacer()
        }.profileNavigationToolbar(title: "App Setting", isTitle: true, isSearch: true, isNotification: true)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .background(
            Color(UIColor.appPrimaryBackground ?? .systemBackground).ignoresSafeArea(.all)
        )
        .onTapGesture(perform: {
            hideKeyboard()
        })
        .onAppear{
            isDark = UserDefaultsManager.shared.getString(forkey: UserDefaultKeys.appAppearance.rawValue) == UserDefaultKeys.dark.rawValue ? true : false
        }
    }
}

// MARK: - Preview
struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
            .preferredColorScheme(.dark)
    }
}
