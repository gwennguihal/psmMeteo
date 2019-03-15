//
//  DayViewModel.swift
//  Meteo
//
//  Created by Guihal Gwenn on 14/03/2019.
//  Copyright © 2019 Guihal Gwenn. All rights reserved.
//

import Foundation
import UIKit

struct DayViewModel {
    
    enum WeatherIcon: String {
        case clear = "clear sky"
        case rain = "rain"
        case clouds = "clouds"
        
        init(icon: String?) {
            switch icon {
            case "clear sky":
                self = .clear
            case "rain":
                self = .rain
            case "clouds":
                self = .clouds
            default:
                if icon?.contains("cloud") == true {
                    self = .clouds
                } else {
                    self = .rain
                }
            }
        }
        
        var image: UIImage? {
            switch self {
            case .clouds:
                return UIImage(named: "cloud")
            case .clear:
                return UIImage(named: "sun")
            case .rain:
                return UIImage(named: "rain")
            }
        }
    }
    
    static var dayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()
    
    static var tempFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    let dayText: String
    let tempText: String
    let icon: UIImage? // https://openweathermap.org/weather-conditions
    
    init(day: MeteoResponse.Day) {
        
        dayText = {
            let date = Date(timeIntervalSince1970: TimeInterval(day.dt))
            return DayViewModel.dayFormatter.string(from: date)
        }()
        
        
        tempText = {
            let minCelsius = NSNumber(value: day.temp.min.kelvinToCelsius)
            let maxCelsius = NSNumber(value: day.temp.max.kelvinToCelsius)
            guard let min = DayViewModel.tempFormatter.string(from: minCelsius), let max = DayViewModel.tempFormatter.string(from: maxCelsius) else {
                return ""
            }
            return "\(min) / \(max) °C"
        }()
        
        icon = WeatherIcon(icon: day.weather.first?.main).image
        
    }
}

extension Float {
    var kelvinToCelsius: Float {
        return self - 273.15
    }
}
