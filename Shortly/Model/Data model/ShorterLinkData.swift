//
//  ShorterLinkData.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 05.07.22.
//

import Foundation

struct ShorterLinkData: Decodable {
 
    let full_short_link: String
    let original_link: String
    
    internal init(full_short_link: String = "", original_link: String = "") {
        self.full_short_link = full_short_link
        self.original_link = original_link
    }
}
