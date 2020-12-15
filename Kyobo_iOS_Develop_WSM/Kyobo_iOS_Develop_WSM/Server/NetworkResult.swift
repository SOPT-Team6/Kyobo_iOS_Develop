//
//  NetworkResult.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/12/15.
//

import Foundation
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
