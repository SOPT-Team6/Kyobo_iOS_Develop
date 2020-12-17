//
//  NewData.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/12/16.
//

import Foundation

// MARK: - NewBook Data
struct NewData: Codable {
    let bookIdx: Int
    let bookImg: String

    enum CodingKeys: String, CodingKey {
        case bookIdx = "book_idx"
        case bookImg = "book_img"
    }
}
