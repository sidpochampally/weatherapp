//
//  Weather.swift
//  YoutubeWeatherAppLatest
//
//  Created by Siddharth Pochampally on 8/9/17.
//  Copyright © 2017 Siddharth Pochampally. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Int
    let description: String
    let icon: String
    let clouds: Double
    let maxTemp: Int
    let minTemp: Int
    
    var tempC: Int {
        get {
            return temp - 273
        }
    }
    
    var maxTempC: Int {
        get {
            return maxTemp - 273
        }
    }
    
    var mintempC: Int {
        get {
            return minTemp - 273
        }
    }

    
    init(cityName: String, temp: Int, description: String, icon: String, clouds: Double, maxTemp: Int, minTemp: Int) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        self.icon = icon
        self.clouds = clouds
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }
}
