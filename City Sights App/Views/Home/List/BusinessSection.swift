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
            ForEach (businesses) { business in
                NavigationLink {
                    BusinessDetailView(business: business)
                } label: {
                    BusinessRow(business: business)
                }

               
            }
        }, header: {
            BusinessSectionHeader(title: title)
        })
    }
}


