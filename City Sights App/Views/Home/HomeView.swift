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
    @State var selectedBusiness: Business?
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                
            // Determine if we should show list or map
                if !isMapShowing {
                    //Show list
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Swich to the map view") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        
                        BuisnessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    ZStack (alignment: .top) {
                        //Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                
                                // Create a business detail view instance
                                //Pass in the selected business
                                BusinessDetailView(business: business)
                            }
                        
                        //Rectangle overlay
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack {
                                Image(systemName: "location")
                                Text("San Francisco")
                                Spacer()
                                Button("Swich to the list view") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }
                        .padding()
                        
                    }
                }
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
