//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by HubertMac on 13/06/2023.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
