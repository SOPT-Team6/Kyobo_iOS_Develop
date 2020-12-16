//
//  PopularData.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by Seri Park on 2020/12/17.
//

import Foundation

// MARK: - NewBook Data
struct PopularData: Codable {
    let searchIdx: Int
    let searchKeyword: String

    enum CodingKeys: String, CodingKey {
        case searchIdx = "search_idx"
        case searchKeyword = "search_keyword"
    }
}

