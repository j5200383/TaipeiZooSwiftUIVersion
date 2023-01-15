//
//  ZooAreaInfo.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import Foundation

struct ZooAreaInfo: Codable, Identifiable, Hashable {
    let id = UUID()
    var name: String
    var picUrl: String
    var info: String
    
    enum CodingKeys: String, CodingKey {
        case name = "e_name"
        case picUrl = "e_pic_url"
        case info = "e_info"
    }
}
