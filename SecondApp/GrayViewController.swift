//
//  GrayViewController.swift
//  SecondApp
//
//  Created by 이빈 on 1/7/25.
//

import UIKit

class GrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true) // push한 화면이기 때문에 dismiss 안 먹음!!
    }
}
