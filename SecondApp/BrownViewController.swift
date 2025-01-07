//
//  BrownViewController.swift
//  SecondApp
//
//  Created by 이빈 on 1/7/25.
//

import UIKit

class BrownViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    
    // 1. Pass Data - 데이터를 받을 공간(프로퍼티 생성)
    var contents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 3. Pass Data - 전달 받은 값을 화면에 표현
        testLabel.text = contents
        
        navigationItem.title = "브라운"
    }
    
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true) // present로 띄운 화면이라, pop 동작 안됨!!
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true)
    }
    

}
