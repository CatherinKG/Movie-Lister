//
//  MovieListManager.swift
//  Movie-Lister
//
//  Created by EVENTORG CATHERINE on 17/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import  UIKit

class MovieListManager {
    class func loadJson(filename fileName: String, completion: (_ response: MovieDataModel?, _ error: Error?) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MovieDataModel.self, from: data)
                completion(jsonData, nil)
                
            } catch {
                print("error:\(error)")
                completion(nil, error)
            }
        }
    }
}
