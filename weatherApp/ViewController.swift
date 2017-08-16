//
//  ViewController.swift
//  weatherApp
//
//  Created by Siddharth Pochampally on 8/16/17.
//  Copyright © 2017 Siddharth Pochampally. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var cloudsLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var cityButton: UIButton!
    
    @IBAction func setCityTapped(_ sender: Any) {
         openCityAlert()
    }
    
    func openCityAlert() {
        let alert = UIAlertController(title: "City", message: "Enter City Name", preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancel)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            //print("Okay")
            let textField = alert.textFields?[0]
            //print(textField?.text!)
            self.cityLabel.text = textField?.text!
            let cityName = textField?.text!
            self.weatherService.getWeather(city: cityName!)
        }
        alert.addAction(ok)
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "City Name"
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func setWeather(weather: Weather) {
        //print("Set Weather")
        //print("City: \(weather.cityName) Temp: \(weather.temp) Desc: \(weather.description)")
        cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.tempC)ºC"
        descriptionLabel.text = "Description: \(weather.description)"
        //cityButton.setTitle(weather.cityName, for: .normal)
        //iconImage.image = UIImage(named: weather.icon)
        cloudsLabel.text = "Clouds: \(weather.clouds)%"
        maxTempLabel.text = "Max Temp: \(weather.maxTempC)ºC"
        minTempLabel.text = "Min Temp: \(weather.mintempC)ºC"
    }
    
    func weatherErrorWithMessage(message: String) {
        print("Weather error message: \(message)")
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherService.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

