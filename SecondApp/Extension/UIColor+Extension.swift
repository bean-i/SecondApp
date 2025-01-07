//
//  UIColor+Extension.swift
//  SecondApp
//
//  Created by 이빈 on 1/6/25.
//

import UIKit

extension UIColor {
    // 저장 프로퍼티, 인스턴스 프로퍼티
    // 저장 프로퍼티는 확장에서 못 씀. (확장은 인스턴스가 생성된 이후에 활용가능하기 때문에)
//    var jackColor = UIColor.red
    
    // 저장 프로퍼티, 타입 프로퍼티
    // 타입프로퍼티는 인스턴스랑 상관없기 때문에, 확장에서 사용할 수 있음.
    static var backColor = UIColor.red
    
    var denColor: UIColor {
        return .red
    }
    
}

