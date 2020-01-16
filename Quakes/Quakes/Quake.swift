//
//  Quake.swift
//  Quakes
//
//  Created by Niranjan Kumar on 1/16/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

// must use class (sublass NSObject for Mapkit)

// Watch first 30 mins of lecture to review JSON parsing with Paul
class Quake: NSObject, Decodable {
    // mag
    // place
    // time
    // coordinate
    
    let magnitude: Double
    let place: String
    let time: Date
    
    enum QuakeCodingKeys: String, CodingKey  {
        case magnitude = "mag"
        case properties
        case place
        case time
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: QuakeCodingKeys.self)
        let properties = try container.nestedContainer(keyedBy: QuakeCodingKeys.self, forKey: .properties)
        
        self.magnitude = try properties.decode(Double.self, forKey: .magnitude)
        self.place = try properties.decode(String.self, forKey: .place)
        time = try properties.decode(Date.self, forKey: .time)
        super.init()
    }
}
