//
//  SearchService.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by Seri Park on 2020/12/17.
//

import Foundation
import Alamofire

struct SearchService {
    static let shared = SearchService()
    
    func search (completion: @escaping (NetworkResult<Any>)->(Void)){
        
        let url = APIConstants.keywordURL
        let header: HTTPHeaders = [
            "Contents-Type" : "multipart/form-data"
        ]
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
    
        dataRequest.responseData { (response) in
        switch response.result {
        case .success:
            guard let statusCode = response.response?.statusCode else {
                return
            }
            guard let data = response.value else {
                return
            }
            completion(judgeSearchData(status: statusCode, data: data))
        case .failure(let err): print(err)
            completion(.networkFail) }
    }
}



func popular (completion: @escaping (NetworkResult<Any>)->(Void)){
    
    let url = APIConstants.popularURL
    let header: HTTPHeaders = [
        "Contents-Type" : "multipart/form-data"
    ]
    let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)

    dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgePopularData(status: statusCode, data: data))
            case .failure(let err): print(err)
                completion(.networkFail) }
        }
    }
}

private func judgeSearchData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SearchData>.self, from: data) else {
            return .pathErr }
        
        switch status {
        case 200:
            return .success(decodedData)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgePopularData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<PopularData>.self, from: data) else {
            return .pathErr }
        
        switch status {
        case 200:
            return .success(decodedData)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
