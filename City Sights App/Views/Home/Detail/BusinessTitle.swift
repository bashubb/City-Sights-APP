//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by HubertMac on 17/06/2023.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Business Name
            Text(business.name!)
                .font(.title2)
                .bold()

                
            
            // Loop through display address
            if business.location?.displayAddress != nil {
                
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                        
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
                
        }
    }
}

