//
//  MovieDataModel.swift
//  Movie-Lister
//
//  Created by EVENTORG CATHERINE on 16/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

struct MovieDataModel: Decodable{
    var page : MovieData
    
    struct MovieData: Decodable {
        var title: String
        var count: String
        var pageNo: String
        var limit: String
        var items : Items
        
        private enum CodingKeys: String, CodingKey{
            case title
            case count = "total-content-items"
            case pageNo = "page-num"
            case limit = "page-size"
            case items = "content-items"
        }
    }
    
    struct Items: Decodable {
        var content : [Content]
    }
    
    struct Content: Decodable {
        var name: String
        var imageName: String
        
        private enum CodingKeys: String, CodingKey{
            case name
            case imageName = "poster-image"
        }
    }
}

