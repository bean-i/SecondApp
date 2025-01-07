//
//  BasicTableViewController.swift
//  SecondApp
//
//  Created by 이빈 on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {

    
    var list = ["aaaaaasdfasdfasdfsdfdsasdfasdfaaaaaasdfasdfasdfsdfdsasdfasdfaaaaaasdfasdfasdfsdfdsasdfasdf", "프로젝트", "메인 업무", "새싹 과제"] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var monster = Monster() // 인스턴스 초기화
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        print(#function)
        let random = ["장보기", "영화보기", "웹툰 보기", "쇼핑"]
        
        let value = random.randomElement()!
        
        list.append(value)
        
        // 뷰와 데이터는 따로 놀아서, 늘 잘 맞춰주어야 한다.
//        tableView.reloadData()
    }
    

    // 1. 셀의 갯수 : numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    // 2. 셀 디자인 및 데이터 처리 : cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jackCell")!
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.setPrimaryLabel("test")
        
        cell.textLabel?.textColor = .blue
        cell.textLabel?.font = .systemFont(ofSize: 30)
        
        // 100% 처리 해줘야 함.
        if indexPath.row < 3 {
            print(indexPath.row)
            cell.backgroundColor = .gray
        } else {
            cell.backgroundColor = .white
        }
        
//        print(indexPath[0], indexPath.section)
//        print(indexPath[1], indexPath.row)
        print(#function, indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        list.remove(at: indexPath.row)
        
//        tableView.reloadData()
    }
    
    // 3. 셀의 높이 : heightForRowAt
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(#function, indexPath)
//        
//        return 80
//    }
    

}
