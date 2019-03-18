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
    let icon: UIImage?
    
    init() {
        
        dayText = "placeHolder" //TODO
        tempText = "placeHolder" //TODO
        icon = nil //TODO
    }
}
