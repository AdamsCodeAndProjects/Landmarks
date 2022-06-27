//
//  Landmark.swift
//  Landmarks
//
//  Created by adam janusewski on 6/23/22.
//

import Foundation
import SwiftUI  // To use Hashable, Codable
import CoreLocation  // To use CLLocationCoordinate2D

//  Codable makes it easier to move data between the struct and a data file
// Lists work on the Identifiable data.  Using Identifiable conforms it to Identifiable Protocol
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // Reads the name of the image from the data.  The computed property will load an image from the assets
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // These coordinates reflect the JSON data struct
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
