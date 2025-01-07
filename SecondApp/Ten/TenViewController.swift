//
//  TenViewController.swift
//  SecondApp
//
//  Created by 이빈 on 1/7/25.
//

import UIKit

// 왜 여기서는 cellForRowAt이 안 나올까?
// 테이블뷰 아웃렛
// 테이블뷰를 만들 때 필요한 것들이 있는 거 같음... 이거 수동으로 다 해줘야 함.
// => 프로토콜 / 딜리게이트

/*
 
 뷰컨트롤러에서 테이블뷰를 사용해보쟈~.~
 1. 테이블뷰 이름!
 2. 테이블뷰 부하직원! (프로토콜) UITableViewDelegate, UITableViewDataSource
 3. 필수 기능
 4. 테이블뷰와 부하직원이 서로 연결 (= 타입으로서의 프로토콜, Protocol as Type)
 
 */

class TenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        let xib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "NoProfileTableViewCell")
        tableView.rowHeight = 100
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        
        cell.backgroundColor = .lightGray
        
        return cell
    }
    


}
