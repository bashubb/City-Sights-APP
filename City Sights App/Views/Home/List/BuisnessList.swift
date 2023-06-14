//
//  BuisnessList.swift
//  City Sights App
//
//  Created by HubertMac on 14/06/2023.
//

import SwiftUI

struct BuisnessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Restaurants", businesses: model.restaurants)
                
                BusinessSection(title: "Sights", businesses: model.sights)
                
            }
        }
    }
}

struct BuisnessList_Previews: PreviewProvider {
    static var previews: some View {
        BuisnessList()
    }
}
