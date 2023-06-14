//
//  BusinessSection.swift
//  City Sights App
//
//  Created by HubertMac on 14/06/2023.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    var body: some View {
        
        Section (content: {
            ForEach (businesses) { buisness in
                Text(buisness.name ?? "")
                Divider()
            }
        }, header: {
            BusinessSectionHeader(title: title)
        })
    }
}


