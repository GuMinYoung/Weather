//
//  ForecastService.swift
//  Weather
//
//  Created by 구민영 on 2022/02/02.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ForecastResult: Codable {
    let forecastList: [List]?
}

// MARK: - List
struct List: Codable {
    let main: Main?
}

// MARK: - Custom Data
struct Forecast {
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    
    init(tempMin: Double, tempMax: Double, humidity: Int) {
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.humidity = humidity
    }
}


struct ForecastService: APIManager {
    static let shared = ForecastService()
    private init() {}
    
    func fetchForeCast(cityId: Int, completion: @escaping ([Forecast]?) -> Void) {
        let urlString = ForecastService.forecastUrl(cityId)
        
        performRequest(with: urlString) { forecastList in
            completion(forecastList)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping ([Forecast]?) -> Void) {
        print(#function)
        
        // 1. URL 구조체 만들기
        guard let url = URL(string: urlString) else { return }

        // 3. 세션에 작업 부여
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            // 데이터 분석하기
            if let forecastList = self.parseJSON(safeData) {
                //print("parse")
                completion(forecastList)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func parseJSON(_ forecastData: Data) -> [Forecast]? {
        print(#function)
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ForecastResult.self, from: forecastData) else {
            print("파싱 실패")
            return [Forecast]()
        }

        guard let forecastLists = decodedData.forecastList else {return [Forecast]()}
     
        let myforecastLists = forecastLists.map {
            Forecast(tempMin: $0.main?.tempMin ?? 0, tempMax: $0.main?.tempMax ?? 0, humidity: $0.main?.humidity ?? 0)
            }
            
            return myforecastLists
    }
}
