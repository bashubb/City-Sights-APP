//
//  HomeView.swift
//  City Sights App
//
//  Created by HubertMac on 14/06/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            // Determine if we should show list or map
            if !isMapShowing {
                //Show list
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "location")
                        Text("San Francisco")
                        Spacer()
                        Text("Swich to Map View")
                    }
                    Divider()
                    
                    BuisnessList()
                }
                .padding([.horizontal, .top])
            }
            
        }
        else {
            // Still wating for data
            ProgressView()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
