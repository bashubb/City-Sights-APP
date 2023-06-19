//
//  YelpAtribution.swift
//  City Sights App
//
//  Created by HubertMac on 19/06/2023.
//

import SwiftUI

struct YelpAtribution: View {
    
    var link: String
    
    var body: some View {
        
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
        
    }
}

struct YelpAtribution_Previews: PreviewProvider {
    static var previews: some View {
        YelpAtribution(link: "http://google.com")
    }
}
