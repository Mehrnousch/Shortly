//
//  ShortlyDataModel.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 24.06.22.
//

import Foundation


class ShortlyDataModel {
    
    enum NetworkError: Error {
        case invalidURL
    }
    
    static let shared = ShortlyDataModel()
    
    
    public func fetchAlbumWithAsyncURLSession(for targetURL: String) async throws -> ShorterLinkResult {
        
        guard let url = URL(string: "https://api.shrtco.de/v2/shorten") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "url": targetURL
        ]
        request.httpBody = parameters.percentEncoded()
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let linkData = try JSONDecoder().decode(ShorterLink.self, from: data)
        return linkData.result
    }
    
    
}

struct ShorterLink: Decodable {
    let ok: Bool
    let result: ShorterLinkResult
}

struct ShorterLinkResult: Decodable {
 
    let full_short_link: String
    let original_link: String
    
    internal init(full_short_link: String = "", original_link: String = "") {
        self.full_short_link = full_short_link
        self.original_link = original_link
    }
}


