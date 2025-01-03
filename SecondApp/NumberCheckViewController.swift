//
//  NumberCheckViewController.swift
//  SecondApp
//
//  Created by 이빈 on 12/30/24.
//

import UIKit

class NumberCheckViewController: UIViewController {

    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewBackground()
        
        getToday()
        
        // 1. 오늘, 2.
        
//        print(NSHomeDirectory())
        
        // userDefaults에 저장된 데이터 가져오기
        let data = UserDefaults.standard.string(forKey: "number")
        numberTextField.text = data
    }
    
    // 매개변수, 반환값이 없는 함수
//    func today() {
//        
//    }
    
    // 함수 내 코드가 한 줄이면 리턴 생략 가능 -> Implicit returns
    func randomInt() -> Int {
        Int.random(in: 1...100)
    }
    
    // Swift Attributes
    @discardableResult
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        
        let today = format.string(from: Date())
        print(today)
        return today
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        // 실시간으로 레이블에 내용 반영
        // Optional String -> String
        // UITextField의 Text를 String 타입으로 변경
        guard let number = numberTextField.text else {
            print("옵셔널 오류")
            return
        }
        
        // number: "5" => 5
//        if Int(number) != nil {
//            print(Int(number)!)
//        } else {
//            print("숫자가 아닙니다!")
//        }
        
//        if let intNumber = Int(number) {
//            resultLabel.text = "\(intNumber)"
//        } else {
//            resultLabel.text = "숫자가 아닙니다!"
//        }
        
        guard let intNumber = Int(number) else {
            resultLabel.text = "숫자가 아닙니다!"
            return
        }
        
        resultLabel.text = "\(intNumber)"
        
        
        // 입력한 내용이 숫자라면 숫자 그대로 출력
        // 입력한 내용이 문자라면 숫자가 아닙니다 출력
        
//        if let number = Int(numberTextField.text!) {
//            resultLabel.text = String(number)
//        } else {
//            resultLabel.text = "숫자를 입력해 주세요."
//        }
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // 텍스트필드에 적었던 내용을 영구적으로 저장.
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        print(#function)
        
        // 사용자에게 성공적으로 저장이 되었다는 알림을 주기
        // Alert
        // 1. 타이틀 + 메시지
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        // 2. 버튼
        let ok = UIAlertAction(
            title: "확인",
            style: .default
        )
        
        let test1 = UIAlertAction(title: "테스트1", style: .default)
        let test2 = UIAlertAction(title: "테스트2", style: .default)
        let test3 = UIAlertAction(title: "테스트3", style: .default)
        
        
        // 3. 본문에 버튼 추가
        alert.addAction(test3)
        alert.addAction(ok)
        alert.addAction(test1)
        alert.addAction(test2)
        
        // 4. 화면에 띄우기
        present(alert, animated: true)
    }
    
}
