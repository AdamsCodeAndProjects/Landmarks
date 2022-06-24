//
//  ModelData.swift
//  Landmarks
//
//  Created by adam janusewski on 6/23/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    //  Array of landmarks initialized from the JSON
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}




// Fetches JSON data with a given name from the app's main bundle
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't fine \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from the main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

