//
//  LocationManager.swift
//  LocationSearch
//
//  Created by Oguz Demırhan on 19.01.2021.
//

import Foundation
import CoreLocation


struct Location {
    let title: String
    let coordinates: CLLocationCoordinate2D?
}

class LocationManager : NSObject {
    
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    
    public func findLocations(with query: String, completion:@escaping (([Location])->Void)) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(query) { (places, err) in
            
            guard let places = places,err == nil else {
                completion([])
                return
            }
            
            let models: [Location] = places.compactMap({ place in
                var name = ""
                if let locationName = place.name {
                    name += locationName
                }
                if let adminRegion = place.administrativeArea {
                    name += ", \(adminRegion)"
                }
                if let locality = place.locality {
                    name += ", \(locality)"
                }
                if let country = place.country {
                    name += ", \(country)"
                }
                
                print(place)
                
                let result = Location(title: name, coordinates: place.location?.coordinate)
                
                return result
            })
            
            completion(models)
        }
    }
}
