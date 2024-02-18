//
//  EditProfileView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import SwiftUI

//var geoLocations: GeoLocations = Bundle.main.decode("GeoLocations.json")

struct EditProfileView: View {
    // MARK: - Properties
    
    // Profile Picture
    @StateObject var profilePicture = ProfilePicture.shared
    @State private var isMediaSelectionPopUp: Bool = false
    
    // UserInfos
    @StateObject var userInfos = UserInfos.shared
    
    // Input Fields
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    // Dismiss view
    @Environment(\.presentationMode) var presentation
    
    // Selected BirthDate
    @State private var dateString: String = "DD/MM/YYYY"
    
    @State private var userGender: UserGender = .male
    
    // GeoLocations
    //    @State private var countryName: [CountryName] = (geoLocations.data ?? [])
    //    @State private var countryNames: Int = 0
    @State private var countryName = countryNames()
    var cityName: [String] {
        return cityNames(countryName: selectedCountry)
    }
    var areaName: [String] {
        return areaNames(city: selectedCity)
    }
    var selectedCountryFlag: String {
        return countryFlag(countryName: selectedCountry)
    }
    
    // Area Selection
    @State private var selectedCountry = ""
    @State private var selectedCity = ""
    @State private var selectedArea = ""
    @State private var gotoNotificationView: Bool = false
    
    // MARK: - Functions
    func saveUserInfo() {
        // Saving to ViewModel
        userInfos.userData.userFirstName = firstName
        userInfos.userData.userLastName = lastName
    }
    
    @State private var date: Date = Date()
    @State private var isDate: Bool = false
    
    
    // MARK: - Body
    var body: some View {
        ZStack{
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    // Profile Image
                    ProfilePictureView(isEditProfilePicture: true, isMediaSelectionPopUp: $isMediaSelectionPopUp)
                        .frame(width: frameSize(minSize: 91.68, dynamicSize: 91.68/393 * DeviceInfos().deviceWidth), height: frameSize(minSize: 91.68, dynamicSize: 91.68/393 * DeviceInfos().deviceWidth))
                    
                    Text("Upload/Change Photo")
                        .font(.custom(FontManager.Montserrat.medium, size: 12))
                        .foregroundColor(Color.hotRed)
                        .padding(.vertical)
                    
                    VStack(spacing: 15) {
                        // First Name
                        LargeTextFieldVModifier(title: "First Name", font: FontManager.Poppins.semiBold) {
                            TextField("", text: $firstName)
                                .placeholderWithCustomColor(when: firstName.isEmpty,alignment: .leading, placeholder: {
                                    Text("Enter your first name")
                                        .foregroundColor(.primary.opacity(0.8))
                                        .font(.custom(FontManager.Poppins.light, size: 12))
                                })
                        }
                        .padding(.bottom, 10)
//                        ProfileTextFieldView(fieldTitle: "First Name", fieldPlaceholder: "Enter your first name", text: $firstName)
                        
                        // Last Name
                        LargeTextFieldVModifier(title: "Last Name", font: FontManager.Poppins.semiBold) {
                            TextField("", text: $lastName)
                                .placeholderWithCustomColor(when: lastName.isEmpty,alignment: .leading, placeholder: {
                                    Text("Enter your last name")
                                        .foregroundColor(.primary.opacity(0.8))
                                        .font(.custom(FontManager.Poppins.light, size: 12))
                                })
                        }
                        .padding(.bottom, 10)
//                        ProfileTextFieldView(fieldTitle: "Last Name", fieldPlaceholder: "Enter your last name", text: $lastName)
                        
                        let width = DeviceInfos().deviceWidth - 60
                        let height = DeviceInfos().deviceHeight
                        
                        // Birth date and gender
                        HStack(alignment: .top ,spacing: 5) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Date of Birth")
                                    .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                HStack {
                                    Text(dateString)
                                        .font(.custom(FontManager.Poppins.light, size: 12))
                                        .minimumScaleFactor(0.5)
                                    Spacer()
                                    
                                    Image("calendar")
                                        .resizable()
                                        .frame(width: frameSize(minSize: 19, dynamicSize: 19/393 * DeviceInfos().deviceWidth), height: frameSize(minSize: 19, dynamicSize: 19/393 * DeviceInfos().deviceWidth))
                                        .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground))
                                } // : HSTACK
                                .padding(.horizontal, 12/393 * width)
                                .frame(width: width / 2.3, height: frameSize(minSize: 48, dynamicSize: 48/853 * DeviceInfos().deviceHeight))
                                .background(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                                .cornerRadius(10)
                                .onTapGesture(perform: {
                                    isDate = true
                                })
                            }
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Sex")
                                    .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                
                                HStack {
                                    HStack(spacing: 2) {
                                        if userGender == .male {
                                            ZStack {
                                                Image(systemName: "circle.fill")
                                                    .scaleEffect(0.5)
                                                Image(systemName: "circle")
                                            }
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                        
                                        Text("Male")
                                            .font(.custom(FontManager.Poppins.medium, size: 14))
                                            .foregroundColor(Color.primary)
                                    }
                                    .foregroundColor(Color.hotRed)
                                    .font(.system(size: frameSize(minSize: 16, dynamicSize: 16/393 * width)))
                                    .onTapGesture(perform: {
                                        userGender = .male
                                    })
                                    
                                    Spacer(minLength: 5)
                                    
                                    HStack(spacing: 2) {
                                        if userGender == .female {
                                            ZStack {
                                                Image(systemName: "circle.fill")
                                                    .scaleEffect(0.5)
                                                Image(systemName: "circle")
                                            }
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                        
                                        Text("Female")
                                            .font(.custom(FontManager.Poppins.medium, size: 14))
                                            .foregroundColor(Color.primary)
                                    }
                                    .foregroundColor(Color.hotRed)
                                    .font(.system(size: frameSize(minSize: 16, dynamicSize: 16/393 * width)))
                                    .onTapGesture(perform: {
                                        userGender = .female
                                    })
                                    
                                    Spacer(minLength: 5)
                                    
                                    HStack(spacing: 2) {
                                        if userGender == .others {
                                            ZStack {
                                                Image(systemName: "circle.fill")
                                                    .scaleEffect(0.5)
                                                
                                                Image(systemName: "circle")
                                            }
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                        
                                        Text("Other")
                                            .font(.custom(FontManager.Poppins.medium, size: 14))
                                            .foregroundColor(Color.primary)
                                    }
                                    .font(.system(size: frameSize(minSize: 16, dynamicSize: 16/393 * width)))
                                    .foregroundColor(Color.hotRed)
                                    .onTapGesture(perform: {
                                        userGender = .others
                                    })
                                }
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .padding(.vertical)
                                //   .frame(width: width / 2, height: frameSize(minSize: 48, dynamicSize: 48/853 * DeviceInfos().deviceHeight))
                            }
                        }
                        
                        
                        VStack(spacing: 0) {
                            HStack(spacing: 8) {
                                //                                    let areaWidth = geo.size.width - 16
                                let areaWidth = DeviceInfos().deviceWidth - 16
                                // Country Selection
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("Country")
                                        .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                    
                                    Menu {
                                        ForEach(0..<countryName.count, id: \.self) { index in
                                            Button {
                                                selectedCountry = countryName[index]
                                                Log.info("country")
                                            } label: {
                                                Text(countryName[index])
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            }
                                        }
                                    } label: {
                                        HStack {
                                            Image("arrowDown")
                                                .resizable()
                                                .frame(width: frameSize(minSize: 8, dynamicSize: 8/393 * width), height: frameSize(minSize: 3, dynamicSize: 3/852 * height))

                                            if !selectedCountryFlag.isEmpty {
                                                Image(countryFlag(countryName: selectedCountry))
                                                    .resizable()
                                                    .frame(width: 18/393 * width, height: 10/852 * height)
                                            }
                                            
                                            Text(selectedCountry.isEmpty ? "Country" : selectedCountry)
                                                .font(.custom(FontManager.Poppins.medium, size: 12))
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                                .lineLimit(1)
                                        }.padding(.trailing, 3)
                                    }
                                    .padding(.leading, 7)
                                    .frame(width: areaWidth * 0.4, alignment: .leading)
                                    .frame(height: frameSize(minSize: 48, dynamicSize: 48/852 * height) ) // width: 8/393 * width,
                                    .background(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                                    .cornerRadius(10)
                                }
                                
                                
                                // City Selection
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("City")
                                        .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                    
                                    Menu {
                                        ForEach(0..<cityName.count, id: \.self) { index in
                                            Button {
                                                selectedCity = cityName[index]
                                                Log.info("city")
                                            } label: {
                                                Text(cityName[index])
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            }
                                        }
                                    } label: {
                                        HStack {
                                            Image("arrowDown")
                                                .resizable()
                                                .frame(width: frameSize(minSize: 8, dynamicSize: 8/393 * width), height: frameSize(minSize: 3, dynamicSize: 3/852 * height))
                                            
                                            Text(selectedCity.isEmpty ? "City" : selectedCity)
                                                .font(.custom(FontManager.Poppins.medium, size: 12))
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                                .lineLimit(1)
                                        }.padding(.trailing, 3)
                                    }
                                    .padding(.leading, 7)
                                    .frame(maxWidth: areaWidth * 0.3, alignment: .leading)
                                    .frame(height: frameSize(minSize: 48, dynamicSize: 48/852 * height)) // width: 8/393 * width,
                                    .background(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                                    .cornerRadius(10)
                                }
                                .disabled(selectedCountry.isEmpty)
                                
                                // Area Selection
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("Area")
                                        .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                    
                                    Menu {
                                        ForEach(0..<areaName.count, id: \.self) { index in
                                            Button {
                                                selectedArea = areaName[index]
                                                Log.info("area")
                                            } label: {
                                                Text(areaName[index])
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            }
                                        }
                                    } label: {
                                        HStack {
                                            Image("arrowDown")
                                                .resizable()
                                                .frame(width: frameSize(minSize: 8, dynamicSize: 8/393 * width), height: frameSize(minSize: 3, dynamicSize: 3/852 * height))

                                            Text(selectedArea.isEmpty ? "Area" : selectedArea)
                                                .font(.custom(FontManager.Poppins.medium, size: 12))
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                                .lineLimit(1)
                                        }.padding(.trailing, 3)
                                    }
                                    .padding(.leading, 7)
                                    .frame(maxWidth: areaWidth * 0.3, alignment: .leading)
                                    .frame(height: frameSize(minSize: 48, dynamicSize: 48/852 * height)) // width: 8/393 * width,
                                    .background(Color(UIColor.largeTextFieldBackground ?? .systemBackground))
                                    .cornerRadius(10)
                                }
                                .disabled(selectedCity.isEmpty)
                            }
                            
                            // Update Button
                            Button {
                                // Save UserData
                                saveUserInfo()
                                // Dismissing from this view
                                self.presentation.wrappedValue.dismiss()
                            } label: {
                                Text("UPDATE")
                                    .font(.custom(FontManager.Montserrat.bold, size: 18))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: frameSize(minSize: 48, dynamicSize: 48/852 * DeviceInfos().deviceHeight))
                                    .foregroundColor(Color.white)
                                    .background(Color.hotRed)
                                    .cornerRadius(10)
                            } // : BUTTON
                            .padding(.top, 52)
                            .padding(.horizontal, 50)
                        }
                        .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground))
//                        .lineLimit(1)
//                        .minimumScaleFactor(0.6)
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 75)
                    
                    Spacer()
                } // : SCROLL
            } // : VSTACK
            .foregroundColor(Color(UIColor.appIconColor ?? .systemBackground))
            
            
            if isDate {
                Color.black.opacity(0.3)
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                        isDate = false
                    }
                
                DatePickerView(dateString: $dateString)
            }
            
            if isMediaSelectionPopUp {
                Color.black.opacity(0.3)
                    .ignoresSafeArea(.all)
                
                // Image selection
                mediaSelectionPopUp()
            }
        }.profileNavigationToolbar(title: "User Profile Edit", isTitle: true, isSearch: true, isNotification: true)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
        .background(
            Color(UIColor.appPrimaryBackground ?? .systemBackground).ignoresSafeArea(.all)
        )
        .onTapGesture(perform: {
            hideKeyboard()
        })
    }
    
    @ViewBuilder
    func mediaSelectionPopUp() -> some View {
        // MARK: - Your PopUp Content which will also perform navigations
        VStack(alignment: .leading) {
            VStack {
                Text("Choose")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold, design: .default))
            }
            .padding(20)
            
            HStack(alignment: .center) {
                // Camera Selection from PopUp
                Button(action: {
                    profilePicture.source = .camera
                    profilePicture.showPhotoPicker()
                    
                    self.isMediaSelectionPopUp = false
                    //                    withAnimation {self.isShowMedia = false}
                    
                }, label: {
                    Image(systemName: "camera.shutter.button.fill")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                })
                
                // Gallary Selection from PopUp
                Button(action: {
                    profilePicture.source = .library
                    profilePicture.showPhotoPicker()
                    
                    self.isMediaSelectionPopUp = false
                    //                    withAnimation {self.isShowMedia.toggle()}
                    
                }, label: {
                    Image(systemName: "photo.tv")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                })
            }
            
            HStack {
                Spacer()
                Button(action: {
                    self.isMediaSelectionPopUp = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color.white)
                })
                .padding(20)
            }
        }
        .frame(width: 331/392 * DeviceInfos().deviceWidth - 60 > 380 ? 400 : 331/392 * DeviceInfos().deviceWidth - 60, height: 180/852 * DeviceInfos().deviceHeight > 220 ? 220 : 180/852 * DeviceInfos().deviceHeight)
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

// MARK: - Preview
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .preferredColorScheme(.dark)
    }
}
