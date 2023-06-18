//
//  LocationDeniedView.swift
//  City Sights App
//
//  Created by HubertMac on 18/06/2023.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Whoops!")
                .font(.title2)
                .bold()
            Text("We need to acces your location to provide you with the best sights in the city. You can change your decision at any time in Settings.")
                .padding()
                .multilineTextAlignment(.center)

            Spacer()
            
            Button {
                // Open Settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    if UIApplication.shared.canOpenURL(url) {
                        // If we can open this settings url then open it
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text("Go to Settings")
                        .foregroundColor(backgroundColor)
                        .bold()
                        .padding()
                }
            }
            .padding()
            
            Spacer()
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(backgroundColor)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
