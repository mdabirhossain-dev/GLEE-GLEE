//
//  Constants.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let baseURL = App.infoForKey("BaseURL") ?? "hhttps://6548b6fcdd8ebcd4ab2372cb.mockapi.io/"
    }
    
    struct APIParameterKey {
        static let postId = "postId"
        static let token = "token"
        static let facebookToken = "facebookToken"
    }
    
    struct App {
        static let googleClientID = "1018340151834-rker812hddaktaogfuif1ba0m5o79kgq.apps.googleusercontent.com"
        
        static func infoForKey(_ key: String) -> String? {
            return (Bundle.main.infoDictionary?[key] as? String)?
                .replacingOccurrences(of: "\\", with: "")
        }
    }
}

enum ContentType: String {
    case json = "application/json"
    case multipartFormData = "multipart/form-data"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case accessToken = "accesstoken"
    case userAgent = "User-Agent"
}

enum UserDefaultKeys: String {
    case appAppearance = "appAppearance"
    case dark = "dark"
    case light = "light"
    case hasLaunchedOnce = "HasLaunchedOnce"

}

enum APIResponseCode: String, Codable {
    case success = "SUCCESS"
    
    case emptyToken = "E_ACCESS_TOKEN_EMPTY"
    case invalidToken = "E_INVALID_TOKEN"
    case expiredToken = "E_TOKEN_EXPIRED"
    case error_validation = "E_VALIDATION_ERROR"
    case not_found = "E_NOT_FOUND"
    case unknown = "E_UNKNOWN"

    init(from decoder: Decoder) throws {
        let stringValue = try decoder.singleValueContainer().decode(String.self)
        self = APIResponseCode(rawValue: stringValue.uppercased()) ?? .unknown
    }
    
    init(stringValue: String) {
        self = APIResponseCode(rawValue: stringValue) ?? .unknown
    }
}
