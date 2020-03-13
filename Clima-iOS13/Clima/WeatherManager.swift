//
//  WeatherManager.swift
//  Clima
//
//  Created by Squiretoss on 20.11.2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
   func didUpdateWeather(_ weatherMenager:WeatherManager,weather: WeatherModel)
    func didFailWithError ( error:Error)
}

struct WeatherManager {
    
    
    var delegate : WeatherManagerDelegate?
    
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0f16f8195f9403842288be36a07efac7&units=metric"
    
    
   func fetchweather(cityName:String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    func performRequest(urlString:String){
        
        
        if  let url = URL(string: urlString) {                      //create a url
                
            
            let session = URLSession(configuration: .default)                    //create a URLsession
            
           let task =  session.dataTask(with: url, completionHandler: handle(data:response:error:))          //give the session a task
            
            task.resume()                           //Start the task
            
        }
        
    }
    
    func handle(data: Data? ,response :URLResponse?,error: Error?){
        
        if error != nil {
            delegate?.didFailWithError(error: error!)
                return
        }
        
        if let safeData = data {
            if let weather =   self.parseJSON(weatherData: safeData){
                self.delegate?.didUpdateWeather(self,weather: weather)
            }
            
            
        }
        
    }
    
    func parseJSON(weatherData:Data) ->WeatherModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            
           
            
            print(weather.conditionName)
             return weather
            
        } catch  {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
       
        
    }
    
    
    
}
