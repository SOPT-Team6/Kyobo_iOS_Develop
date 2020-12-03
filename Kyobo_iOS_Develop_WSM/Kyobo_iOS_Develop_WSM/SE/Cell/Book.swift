//
//  Book.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by Seri Park on 2020/12/01.
//

import UIKit

struct Book {
    var name : String
    var writer : String
    var BookImageName : String
    var explain : String
    var ebook : String
    
    func makeBookImage () -> UIImage? {
        return UIImage (named: BookImageName)
    }
}
