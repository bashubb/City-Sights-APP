//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by HubertMac on 13/06/2023.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
