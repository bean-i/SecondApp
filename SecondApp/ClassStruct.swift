//
//  ClassStruct.swift
//  SecondApp
//
//  Created by 이빈 on 1/2/25.
//

import Foundation

// 1. 가지고 있는 프로퍼티를 모두 초기화
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언 -> 사용 주의

class Monster {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    // 이니셜라이저
    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
}

class BossMonster: Monster {

}

class SuperMonster: BossMonster {

}
// 클래스의 경우 상속이 일어날 수 있기 때문에, 잘 찾아가기 위해서는? init이 필요하다..

struct MonsetrStruct {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    // init이 없더라도 기본적으로 제공해줌! => 멤버와이즈 이니셜라이저 (초기화 구문)
}
