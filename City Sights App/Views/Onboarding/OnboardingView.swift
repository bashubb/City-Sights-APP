//
//  OnboardingView.swift
//  City Sights App
//
//  Created by HubertMac on 18/06/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        VStack () {
            
            // TabView
            TabView(selection: $tabSelection) {
                
                // First tab
                VStack (spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                        .multilineTextAlignment(.center)
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                // Secont tab
                VStack (spacing:20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venuess and more, based on your location!")
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            
            Button {
                
                // Detect which tab it is
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // TODO: Request for geolocation permission
                    model.requestGeolocationPermission()
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                }
                .padding()
                .padding(.bottom, 20)
                .accentColor(tabSelection == 0 ? blue : turquoise)
            }
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea()
        
    }
        
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
