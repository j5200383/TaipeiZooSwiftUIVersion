//
//  Response.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import Foundation

struct Response<T:Codable>: Codable {
    var result: Result<T>
}

struct Result<T: Codable>: Codable {
    var limit: Int?
    var offset: Int?
    var count: Int?
    var sort: String?
    var results: T
}
