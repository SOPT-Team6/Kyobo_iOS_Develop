//
//  ReadingService.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/12/16.
//

import Foundation
import Alamofire

struct ReadingService {
    
    static let shared = ReadingService()
    
    func reading(completion: @escaping (NetworkResult<Any>)->(Void)){
        
        let url = APIConstants.readingBookURL
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
                completion(judgeReadingData(status: statusCode, data: data))
            case .failure(let err): print(err)
                completion(.networkFail) }
        }
    }
    
    private func judgeReadingData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<ReadingData>.self, from: data) else {
            return .pathErr }
        
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}




