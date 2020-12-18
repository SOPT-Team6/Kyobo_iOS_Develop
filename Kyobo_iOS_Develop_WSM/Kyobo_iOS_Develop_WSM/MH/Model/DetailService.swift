//
//  DetailService.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/12/18.
//

import Foundation
import Alamofire

struct DetailService {
    static let shared = DetailService()
    private func makeParameter(_ index: Int) -> Parameters {
        return ["book_idx": index]
    }
    func getReadingBookDetail(index: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.rbDetailURL, method: .post, parameters: makeParameter(index), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judge(by: statusCode, data))
            case .failure(let err) :
                print(err)
                
            }
            
        }
    }
    func getNewBookDetail(index: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.nbDetailURL, method: .post, parameters: makeParameter(index), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judge(by: statusCode, data))
            case .failure(let err) :
                print(err)
                
            }
            
        }
    }
    private func judge(by statusCode: Int, _ result: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return rbDetail(by: result)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func rbDetail(by result: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SearchData>.self, from: result) else { return .pathErr }
        return .success(decodedData)
    }
}
