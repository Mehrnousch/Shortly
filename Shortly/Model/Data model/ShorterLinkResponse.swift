//
//  ShorterLinkResponse.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 05.07.22.
//

import Foundation

struct ShorterLinkResponse: Decodable {
    let ok: Bool
    let result: ShorterLinkData
}
