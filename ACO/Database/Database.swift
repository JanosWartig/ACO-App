//
//  Database.swift
//  ACO
//
//  Created by Janos Wartig on 07.06.22.
//

import Foundation
import CoreLocation

class Database {
    
    public static let data: [DataModal] = [
        DataModal(name: "Alster", coordinates: CLLocationCoordinate2D(latitude: 53.555252, longitude: 9.9893383), description: "", fuellstand: 50, salzhaltigkeit: 30, truebheit: 20, tag: Tags.Wasserspeicher, letzteWartung: "12.03.2021", imageName: "hello"),
        DataModal(name: "Grossneumarkt", coordinates: CLLocationCoordinate2D(latitude: 53.5517823, longitude: 9.9766418), description: "", fuellstand: 50, salzhaltigkeit: 30, truebheit: 20, tag: Tags.Wasserspeicher, letzteWartung: "15.04.2022", imageName: "hello"),
        DataModal(name: "Portugiesenviertel", coordinates: CLLocationCoordinate2D(latitude: 53.5457768, longitude: 9.9727915), description: "", fuellstand: 50, salzhaltigkeit: 30, truebheit: 20, tag: Tags.Wasserspeicher, letzteWartung: "26.12.2018", imageName: "hello")
    ]

}

enum Tags: String {
    case Wasserspeicher
}

class DataModal: Identifiable {
    
    private let tag: Tags
    private let name: String
    private let coordinates: CLLocationCoordinate2D
    private let description: String
    private let fuellstand: Double
    private let salzhaltigkeit: Float
    private let truebheit: Float
    private let letzteWartung: String
    private let imageName: String
    let id = UUID()
    
     
    init(name: String, coordinates: CLLocationCoordinate2D, description: String, fuellstand: Double, salzhaltigkeit: Float, truebheit: Float, tag: Tags, letzteWartung: String, imageName: String) {
        self.name = name
        self.coordinates = coordinates
        self.description = description
        self.fuellstand = fuellstand
        self.salzhaltigkeit = salzhaltigkeit
        self.truebheit = truebheit
        self.tag = tag
        self.letzteWartung = letzteWartung
        self.imageName = imageName
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func getCoordinates() -> CLLocationCoordinate2D {
        return self.coordinates
    }
    
    public func getFuellstand() -> Double {
        return self.fuellstand
    }
    
    public func getSalzhaltigkeit() -> Float {
        return self.salzhaltigkeit
    }
    
    public func getTruebheit() -> Float {
        return self.truebheit
    }
    
    public func getTag() -> Tags {
        return self.tag
    }
    
    public func getLetzteWartung() -> String {
        return self.letzteWartung
    }
    
    public func getImageName() -> String {
        return self.imageName
    }
}
