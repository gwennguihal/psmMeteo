//
//  Meteo.swift
//  Meteo
//
//  Created by Guihal Gwenn on 14/03/2019.
//  Copyright © 2019 Guihal Gwenn. All rights reserved.
//

import Foundation

struct MeteoResponse: Decodable {
    
    struct City: Decodable {
        let name: String
    }
    
    struct Day: Decodable {
        
        struct Temp: Decodable {
            let min: Float
            let max: Float
        }
        
        struct Weather: Decodable {
            let main: String
            let icon: String
        }
        
        let dt: Int
        let temp: Temp
        let weather: [Weather]
    }
    
    let city: City
    let list: [Day]
}

