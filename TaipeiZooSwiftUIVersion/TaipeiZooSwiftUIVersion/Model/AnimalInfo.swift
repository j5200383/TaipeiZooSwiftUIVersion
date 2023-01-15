//
//  AnimalInfo.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/9.
//

import Foundation

struct AnimalInfo: Codable, Hashable {
    let id = UUID()
    var name: String
    var enName: String
    var alsoknown: String
    var feature: String
    var behavior: String
    var location: String
    var picUrl: String
    var update: String
    
    enum CodingKeys: String, CodingKey {
        case name = "a_name_ch"
        case enName = "a_name_en"
        case alsoknown = "a_alsoknown"
        case feature = "a_feature"
        case behavior = "a_behavior"
        case location = "a_location"
        case picUrl = "a_pic01_url"
        case update = "a_update"
    }
    
    init(name: String, enName: String, alsoknown: String, feature: String, behavior: String, location: String, picUrl: String, update: String) {
        self.name = name
        self.enName = enName
        self.alsoknown = alsoknown
        self.feature = feature
        self.behavior = behavior
        self.location = location
        self.picUrl = picUrl
        self.update = update
    }

}
