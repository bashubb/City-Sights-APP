//
//  BusinessDetailView.swift
//  City Sights App
//
//  Created by HubertMac on 15/06/2023.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                GeometryReader () {geometry in
                    
                    // Business Image
                    let uiImage = UIImage(data: business.imageData ?? Data ())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                // Open/closed indicatior
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open" )
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
        
            
            Group {
                
                // Business Name
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                    
                
                // Loop through display address
                if business.location?.displayAddress != nil {
                    
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                            .padding(.horizontal)
                    }
                }
                
                // Rating
                Image("regular_\(business.rating ?? 0)")
                    .padding()
                
                Divider()
                
                // Phone
                HStack {
                    Text("Phone: ")
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                
                
                Divider()
                
                
                // Reviews
                HStack {
                    Text("Reviews: ")
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
                
                // Website
                HStack {
                    Text("Website: ")
                    Text(business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }.padding()
                
                Divider()
                
            }
            
            // Get directions button
            Button {
                //TO DO: Show directions
            } label: {
                ZStack{
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            }.padding()

        }
    }
}


