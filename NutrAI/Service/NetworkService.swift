//
//  NetworkService.swift
//  NutrAI
//
//  Created by Thalys Viana on 03/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

final class NetworkService {
    static func get<T: Codable>(url: String, type: T.Type, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: url) else {
            print("Could not load url")
           return
        }
        
        let session = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil,
                let data = data else {
                print("An error has occured while loading data")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(result, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            session.resume()
        }
    }
    
}
