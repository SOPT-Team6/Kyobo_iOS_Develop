//
//  UIImageView+Extension.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/12/15.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(from url: String, completion: @escaping (UIImage?) -> Void)
    {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(),
                         options: [.transition(.fade(1))], progressBlock: nil) {
            result in switch result {
            case .success(let value):
                completion(value.image)
            case .failure(let err):
                print(err.errorCode)
                completion(nil)
            }
        }
    }
}
