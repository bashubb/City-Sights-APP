//
//  ContentModel.swift
//  City Sights App
//
//  Created by HubertMac on 13/06/2023.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        // Init method of NSObject
        super.init()
        
        //Set content model as the delegate of the loication manager
        locationManager.delegate = self
        
        // Request premission from the user
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == . authorizedWhenInUse{
            
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            
            // We don't have permission
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Gives us the lopcation of the user
        print(locations.first ?? "no location")
        
        //Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
        
        // TODO : IF we have the coordinates of the user, send into Yelp API
    }
}
