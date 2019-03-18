//
//  MeteoTests.swift
//  MeteoTests
//
//  Created by Guihal Gwenn on 14/03/2019.
//  Copyright © 2019 Guihal Gwenn. All rights reserved.
//

import XCTest
@testable import Meteo

class MeteoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_kelvinToCelsius() {
        // given
        let kelvin: Float = 1
        // when
        let celsius = kelvin.kelvinToCelsius
        // then
        XCTAssertEqual(celsius, -272.15)
    }

}
