//
//  PracticeViewController.swift
//  SecondApp
//
//  Created by 이빈 on 12/31/24.
//

import UIKit

class PracticeViewController: UIViewController {
    
    let colorList: [UIColor] = [
        .red,
        .yellow,
        .green,
        .orange,
        .purple,
        .cyan
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self, #function)
    }
    
    // 
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }
    
    // 스토리보드에서 연결하는 게 아니라, 코드로 직접 타이핑
    // 터널
    @IBAction func unwindToPracticeViewController(_ sender: UIStoryboardSegue) {
        print(#function)
    }

}
