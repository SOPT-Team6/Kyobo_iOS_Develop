//
//  APIConstants.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/12/15.
//

import Foundation

struct APIConstants {
    
    static let baseURL = "http://13.209.53.240:3000"
    
    // ReadingBook 리스트 조회 url
    static let readingBookURL = baseURL + "/main/Rb"
    // ReadingBook 상세내용 조회 url
    static let rbDetailURL = baseURL + "/detail/readingbook"
    
    // NewBook 리스트 조회 url
    static let newBookURL = baseURL + "/main/Nb"
    // NewBook 상세내용 조회 url
    static let nbDetailURL = baseURL + "/detail/newbook"
    
    // 키워드 검색 url
    static let keywordURL = baseURL + "/search/"
    
    // 인기 검색어 조회 url
    static let popularURL = baseURL + "/search/popular/keyword"
}
