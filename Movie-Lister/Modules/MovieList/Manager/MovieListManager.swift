//
//  MovieListManager.swift
//  Movie-Lister
//
//  Created by CATHERINE on 17/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import  UIKit

class MovieListManager {
    func loadJson(pageNumber number: Int, completion: (_ response: MovieDataModel?, _ error: Error?) -> ()) {
        if let url = getUrlForJson(pageNumber: number) {
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
    
    fileprivate func getUrlForJson(pageNumber: Int) -> URL? {
        
        switch pageNumber {
            
        case 1:
            return Bundle.main.url(forResource: "CONTENTLISTINGPAGE-PAGE1", withExtension: "json")
            
        case 2:
            return Bundle.main.url(forResource: "CONTENTLISTINGPAGE-PAGE2", withExtension: "json")
            
        case 3:
            return Bundle.main.url(forResource: "CONTENTLISTINGPAGE-PAGE3", withExtension: "json")
            
        default:
            return nil
        }
    }
}
