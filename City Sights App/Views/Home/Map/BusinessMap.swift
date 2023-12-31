//
//  BusinessMap.swift
//  City Sights App
//
//  Created by HubertMac on 15/06/2023.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    @Binding var selectedBusiness: Business?
    
    var locations: [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        //Create a set of annotations from our list of businesses
        for business in model.restaurants + model.sights {
            
            // If the business has a lat/long, create an MKPointAnnotation for it
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                
                // Create a new annotation
                var a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat , longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
            
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        //Make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // ADD the ones based on the business
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
    }
    
    
    // MARK: Coordinator class
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map:self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
            // If the annotation is the user blue dot, return nil
            if annotation is MKUserLocation {
                return nil
            }
            
            
            // Check if there is reusable view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                
                // Create an annotation view
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                
                // We got a resuable one
                annotationView!.annotation = annotation
            }
            
            // Return it
            
            return annotationView
            
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            // User tapped on the annotationview
            
            // Get the businbess object that this annotation represents
            // Loop through business in the model and find a match
            for business in map.model.restaurants + map.model.sights {
                
                if business.name == view.annotation?.title {
                    
                    // Set the selectedBusiness property to the business object
                    map.selectedBusiness = business
                    return
                }

            }

        }
    
    }
}
