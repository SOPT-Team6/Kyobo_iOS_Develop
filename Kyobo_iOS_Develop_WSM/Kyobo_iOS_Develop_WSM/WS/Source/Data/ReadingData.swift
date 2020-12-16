//
//  ReadingData.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/12/16.
//

import Foundation

// MARK: - ReadingNow Data
struct ReadingData: Codable {
    let bookIdx: Int
    let bookImg: String
    let bookKind, bookName, bookAuthor: String

    enum CodingKeys: String, CodingKey {
        case bookIdx = "book_idx"
        case bookImg = "book_img"
        case bookKind = "book_kind"
        case bookName = "book_name"
        case bookAuthor = "book_author"
    }
}
