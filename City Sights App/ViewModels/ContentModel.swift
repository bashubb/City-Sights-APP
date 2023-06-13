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
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // We have a location
            //Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // If we have the coordinates of the user, send into Yelp API
            //getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
        }
    }
    
    // MARK: - Yelp API methods
    
    func getBusinesses(category:String, location:CLLocation) {
    
        // Create URL
        /*
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        
        let url = URL(string: urlString)
         */
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6"),
        ]
        var url = urlComponents?.url
        
        if let url = url {
            
            
            //Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer AJoDFpWkhzu2tU5XdJAFtTzgZ6Op3WUPGyFx2hYixB97L99_5JlZZQJeNOwXrvtovFDppKxjIpBKI5iBGb324WPp6AsP3SYUjA972zMQUeNV5CLy-u_BGB0Y2rGIZHYx", forHTTPHeaderField: "Authorization")
            
            // Get URLSession
            let session = URLSession.shared
            
            // Create Data task
            let dataTask = session.dataTask(with: request) { data, response, error in
                //Check that there isn't an error
                if error == nil {
                    print(response ?? "")
                }
            }
            
            // Start the Data Task
            dataTask.resume()
        }
    }
}
