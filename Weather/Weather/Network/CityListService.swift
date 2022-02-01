//
//  Service.swift
//  Weather
//
//  Created by 구민영 on 2022/01/28.
//

import Foundation

struct CityListService: APIManager {
    let group = DispatchGroup()
    
    let workingQueue = DispatchQueue(label: "city.concurrent", attributes: .concurrent)
    let defaultQueue = DispatchQueue.global()
    static let shared = CityListService()
    private init () {}
    
    func fetchCityList(completion: @escaping ([City]?) -> Void) {
        let urlStrings = CityCode.dic.map {
            CityListService.curWeatherUrl($0.key)
        }
        var arr = [City]()
        
        workingQueue.async(group: group) {
            urlStrings.forEach { urlString in
                group.enter()
                performRequest(with: urlString) { city in
                    if let city = city {
                        arr.append(city)
                        group.leave()
                    }
                }
            }
        }
        
        group.notify(queue: defaultQueue) {
            //print("그룹 끝")
            completion(arr)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping (City?) -> Void) {
        //print(#function)
        
        workingQueue.async(group: group) {
            guard let url = URL(string: urlString) else { return }
            
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
                
                let city = self.parseJSON(safeData)
                defaultQueue.async {
                    completion(city)
                }
            }.resume()
        }
    }
    
    
    func parseJSON(_ data: Data) -> City {
        //print(#function)
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(CityData.self, from: data) else {
            print("파싱 실패")
            return City()
        }
        
        return City(name: CityCode.dic[decodedData.id ?? 0] ?? "none", temp: (decodedData.main?.temp) ?? 0, humidity: (decodedData.main?.humidity) ?? 0, iconId: decodedData.weather?.first?.icon ?? "01d")
    }
    
    // todo
    // - 액티비티 인디케이터
}

