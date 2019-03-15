//
//  MeteoViewModel.swift
//  Meteo
//
//  Created by Guihal Gwenn on 14/03/2019.
//  Copyright © 2019 Guihal Gwenn. All rights reserved.
//

import Foundation
import Alamofire

protocol MeteoViewModelDelegate: class {
    func fetchSucess()
    func fetchFailure(error: MeteoViewModel.MeteoError)
}

class MeteoViewModel {
    
    weak var delegate: MeteoViewModelDelegate?
    
    enum MeteoError: Error {
        case parsingFailed
        case networkError
        
        var message: String {
            switch self {
            case .parsingFailed:
                return "Parsing failed"
            case .networkError:
                return "Problème réseau"
            }
        }
    }

    var title = "Metéo"
    
    var headerTitle: String = "Chargement.."
    var days = [DayViewModel]()
    
    func fetch() {
        
        let url = "https://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"
        
        Alamofire.request(url).responseData { [weak self] response in
            
            guard let self = self else {
                return
            }
            
            switch (response.result) {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                do {
                    let response = try jsonDecoder.decode(MeteoResponse.self, from: data)
                    self.parse(response: response)
                    self.delegate?.fetchSucess()
                } catch (_) {
                    self.delegate?.fetchFailure(error: .parsingFailed)
                }
            case .failure( _):
                self.delegate?.fetchFailure(error: .networkError)
            }
        }
    }
    
    func parse(response: MeteoResponse) {
        self.days = response.list.map(DayViewModel.init)
        self.headerTitle = "Météo\n\(response.city.name)"
    }
}
