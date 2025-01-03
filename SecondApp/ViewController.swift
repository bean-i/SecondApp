//
//  ViewController.swift
//  SecondApp
//
//  Created by 이빈 on 12/30/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    
    
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //posterImageView.image = UIImage(named: "")
        if let url = URL(string: "https://item.kakaocdn.net/do/7277796c3f7ef108040dcfde1bd2fb9c15b3f4e3c2033bfd702a321ec6eda72c") {
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(systemName: "star")
        }
        
        
        print(resultLabel.isUserInteractionEnabled)
        resultLabel.isUserInteractionEnabled = true
        
        checkButton.isUserInteractionEnabled = false
    }

    
    
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        let text = wordTextField.text!.lowercased()
        
        print(text)
        
        // 공백 제거 whitespace
        if text.count == 0 {
            resultLabel.text = "검색어를 작성해 주세요."
        } else if text == "jmt" {
            resultLabel.text = "완전 맛있음"
        } else {
            resultLabel.text = "\(text)로 입력했어요"
        }

    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        
        print(#function)
        
    }
    
    func aboutOptional() {
        // : String? 옵셔널 스트링 타입
        var nickname: String? = "고래밥"
        var age: Int? = 22
        
        nickname = nil
        
        // 1. 조건문을 통해 옵셔널 언래핑
        if nickname == nil {
            print("닉네임에 문제가 있어요")
        } else {
            print("\(nickname!)으로 설정합니다")
        } // 이렇게 되면 매번 !을 붙여줘야됨..귀찮으니까 -> 옵셔널 바인딩
        
        if nickname != nil {
            print("\(nickname!)으로 설정합니다")
        } else {
            print("닉네임에 문제가 있어요")
        }
        
        // 2. 옵셔널 바인딩: if let / guard
        // Swift5.7 if let shorthand
        if let nickname = nickname { // nickname: String, nickname: String?
            // 조건문 안에서만 쓰이는 변수와 함수 안에서 쓰이는 변수
            // 이름 똑같이 써도 상관X 보통 똑같이 씀.
            print("\(nickname)으로 설정합니다")
        } else {
            print("닉네임에 문제가 있어요")
        }
        
        // if let shorthand
        if let age { // 이름은 똑같이 써야함
            print(age)
        } else {
            print("나이가 nil입니다")
        }
        
        print(age) // Int?
        
        guard let age else {
            print("옵셔널 해제를 실패했습니다 age가 nil임")
            return // 방어막. 해당 값이 nil이면 문제가 있는 경우에 함수를 종료시키기 위해 사용 됨.
        }
        // guard let 사용하면 옵셔널이 풀린 채로 사용 가능.
        // 조건문 밖에서도 사용 가능. (if let 사용하면 조건문 내에서만 사용 가능)
        print(age) // Int
        
        // 3. ??
        print(nickname ?? "손님")
        
        // 4. 옵셔널 체이닝
        wordTextField.text?.count //text가 nil이면 뒤에 .count 실행 안 됨.
        
        if let text = wordTextField.text {
            print(text.count)
        }
    }

}

