//
//  WeatherService.swift
//  YoutubeWeatherAppLatest
//
//  Created by Siddharth Pochampally on 8/9/17.
//  Copyright © 2017 Siddharth Pochampally. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
    func weatherErrorWithMessage(message: String)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        let cityEscaped = city.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=f38b11fbe0060e05c662804bb5d251db") {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                //print(data)
                let json = JSON(data!)
                let lon = json["coord"]["lon"].double
                let lat = json["coord"]["lat"].double
                let temp = json["main"]["temp"].int
                let name = json["name"].string!
                let desc = json["weather"][0]["description"].string
                let icon = json["weather"][0]["icon"].string
                let clouds = json["clouds"]["all"].double
                let maxTemp = json["main"]["temp_max"].int
                let minTemp = json["main"]["temp_min"].int
                
                let weather = Weather(
                    cityName: name,
                    temp: temp!,
                    description: desc!,
                    icon: icon!,
                    clouds: clouds!,
                    maxTemp: maxTemp!,
                    minTemp: minTemp!
                )
                
                if self.delegate != nil {
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.delegate?.setWeather(weather: weather)
                    })
                
                print("Lat: \(lat!) Lon: \(lon!) Temp: \(temp!)")
            }
        })
        task.resume()
        }
        
        
        
        
        
        /*print("Weather service for city: \(city)")
        
        let weather = Weather(cityName: city, temp: 237.12, description: "A nice day")
        
        if delegate != nil {
            delegate?.setWeather(weather: weather)
        }*/
    }
}
