//
//  SearchData.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by Seri Park on 2020/12/17.
//

import Foundation

// MARK: - ReadingNow Data
struct SearchData: Codable {
    let bookIdx : Int
    let bookImg, bookKind, bookName, bookAuthor, bookInfo : String

    enum CodingKeys: String, CodingKey {
        case bookIdx = "book_idx"
        case bookImg = "book_img"
        case bookKind = "book_kind"
        case bookName = "book_name"
        case bookAuthor = "book_author"
        case bookInfo = "book_info"
    }
}


