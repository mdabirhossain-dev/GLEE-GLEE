//
//  ProfileView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 27/9/23.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @StateObject var userInfos = UserInfos.shared
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isShowInformation: Bool = false
    @State private var gotoNotificationView: Bool = false
    @State private var parentalLockUnlock: String = "Lock"
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // User Info
                    HStack(spacing: 12) {
                        // let imgFrame = 67/393 * DeviceInfos().deviceWidth > 80 ? 80 : 67/393 * DeviceInfos().deviceWidth
                        // Profile Picture
                        VStack{
                            ProfilePictureView(isEditProfilePicture: false, isMediaSelectionPopUp: .constant(false))
                                .frame(width: 94, height: 94)
                                .disabled(true)
                            
                            Text("Md. Mahafujul Islam")
                                .font(.custom(FontManager.Poppins.semiBold, size: 16))
                                
                            NavigationLink{
                                EditProfileView()
                            } label: {
                                Text("Edit Profile")
                                    .foregroundColor(.white)
                                    .font(.custom(FontManager.Poppins.medium, size: 10))
                                    .padding(3)
                                    .padding(.horizontal, 6)
                                    .background(
                                        Color(red: 0.91, green: 0.2, blue: 0.19)
                                            .cornerRadius(12)
                                    )
                            }
                        }
                    }
                    
                    VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            NavigationLink {
                                MovieRequestView()
                            } label: {
                                ProfileOptionView(image: "sendEmailIcon", title: "Send Movie Request", arrowRotation: .constant(false))
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .overlay (
                                    Color.gray.opacity(0.4)
                                )
                            
                            NavigationLink{
                                ParentalLockAndUnlockView().navigationBarBackButtonHidden(true)
                            } label: {
                                ProfileOptionView(image: "parentalLockIcon", title: "Parental Pin \(parentalLockUnlock)", arrowRotation: .constant(false))
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .overlay (
                                    Color.gray.opacity(0.4)
                                )
                            
                            // App Settings
                            NavigationLink(destination: AppSettingsView()) {
                                ProfileOptionView(image: "setting", title: "App Setting", arrowRotation: .constant(false))
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .overlay (
                                    Color.gray.opacity(0.4)
                                )
                            
                            // My History
                            NavigationLink{
                                HistoryView()
                            }label:{
                                ProfileOptionView(image: "history-Profile", title: "History", arrowRotation: .constant(false))
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .overlay (
                                    Color.gray.opacity(0.4)
                                )
                        }
                        VStack(spacing: 0){
                        // Information(Expandable)
                        Button {
                            withAnimation {
                                isShowInformation.toggle()
                            }
                        } label: {
                            ProfileOptionView(image: "info.i", title: "Information", arrowRotation: $isShowInformation)
                        }
                        
                        VStack {
                            if isShowInformation {
                                NavigationLink{
                                    InformationView(infoData: termsAndConditions)
                                }label: {
                                    ProfileInformationExpandableView(title: "T&C")
                                }
                                
                                
                                NavigationLink{
                                    InformationView(infoData: faqDatas)
                                }
                            label: {
                                ProfileInformationExpandableView(title: "FAQ")
                            }
                                
                                NavigationLink{
                                    InformationView(infoData: privacyNotice)
                                } label: {
                                    ProfileInformationExpandableView(title: "Privacy Notice")
                                }
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .overlay (
                                    Color.gray.opacity(0.4)
                                )
                        }
                        
                        NavigationLink{
                            SupportView()
                        }label: {
                            ProfileOptionView(image: "headphone.24:7", title: "Support", arrowRotation: .constant(false))
                            
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .overlay (
                                Color.gray.opacity(0.4)
                            )
                    }
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(spacing: 9) {
                        // LogOut Button
                        Button {
                            
                        } label: {
                            Text("Log Out")
                                .font(.custom(FontManager.Poppins.semiBold, size: 16)) // Monsterrat - semibold
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity)
                                .frame(height: frameSize(minSize: 42, dynamicSize: 42/853 * DeviceInfos().deviceHeight))
                                .background(
                                    VStack {
                                    if colorScheme == .dark {
                                        LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.5).cgColor), Color(UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1).cgColor), Color(UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.5).cgColor)]), startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(13)
                                    } else {
                                        Color.clear
                                    }
                                    }
                                )
                                .overlay (
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.hotRed, lineWidth: 2)
                                )
                            
                        }
                        .padding(.top, 53)
                        .padding(.horizontal, 33)
                        
                        Button {
                            
                        } label: {
                            Text("Delete Account")
                                .font(.custom(FontManager.Poppins.medium, size: 10)) // Monsterrat - semibold
                                .foregroundColor(Color.hotRed)
                                .underline(color: Color.hotRed)
                        }
                        
                        // App Version
                        Text("App Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")")
                            .font(.custom(FontManager.Poppins.medium, size: 10)) // Monsterrat - medium
                    }
                }
                .padding(.bottom, 75)
                
                Spacer()
            }
        }.profileNavigationToolbar(title: "", isTitle: false, isSearch: true, isNotification: true)
        .preferredColorScheme(.dark)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .background(
            Color(UIColor.appPrimaryBackground ?? .systemBackground)
                .ignoresSafeArea(.all)
        )
        .onAppear{
            parentalLockUnlock = UserDefaults.standard.string(forKey: "parentalControl") ?? "Lock"
        }
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
