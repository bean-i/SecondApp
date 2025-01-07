//
//  UserTableViewController.swift
//  SecondApp
//
//  Created by 이빈 on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "타이틀"
        let star = UIImage(systemName: "star")
        let right = UIBarButtonItem(image: star, style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.rightBarButtonItem = right
        
        
        
        
//        // Xib cell
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
    }
    
    @objc func rightBarButtonItemTapped() {
        print(#function)
        // 1. 스토리보드 특정 (어떤 스토리보드에 있는 화면인지 모름)
        let sb = UIStoryboard(name: "User", bundle: nil)
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
        
        // 2. 전환할 뷰컨트롤러를 가져오기 GrayVC
        // storyboardID Identity 설정 해주기!!
        let vc = sb.instantiateViewController(withIdentifier: "GrayViewController")
        
        // 3. 화면을 전환할 방법 선택하기 - 우측에서 등장 / show / navigation / push
        // 네비게이션컨트롤러가 화면 전환을 담당하기 때문에, 네비게이션컨트롤러가 있는지 확인 해야 함.
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        print(friends[sender.tag])
        
        friends[sender.tag].like.toggle()
        
//        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)],
                             with: .fade)
        
        print(friends[sender.tag])
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\(indexPath.row)번 째")
        print(#function)

//        let cell = UserTableViewCell()
        
        // UserTableViewCell 인스턴스
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        cell.configureData(row: friends[indexPath.row])
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
//        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
        
        // 1. 스토리보드 특정 (어떤 스토리보드에 있는 화면인지 모름)
        let sb = UIStoryboard(name: "User", bundle: nil)
        
        // 2. 전환할 뷰컨트롤러를 가져오기 BrownVC
//        let vc = BrownViewController() // 코드로 작성할 때.
        
        // storyboardID Identity 설정 해주기!!
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        
        // 값 전달 시 아웃렛 활용을 할 수 없음 (해당 코드가 실행되는 시점보다 아웃렛이 나중에 만들어진다.)
//        vc.testLabel.text = "고래밥"
        // 2. Pass Data - vc가 갖고 있는 프로퍼티에 데이터 추가
        vc.contents = friends[indexPath.row].name
        
        // 전환할 화면에 대한 스타일 적용은 전환할 때 해준다!
        // (옵션2) present 이지만 navi title도 쓰고 싶다면, 다시 네비게이션 컨트롤러를 임베드 해서 네비게이션 컨트롤러를 present
        let nav = UINavigationController(rootViewController: vc) // 네비게이션컨트롤러 임베드 하는 코드
        
        // (옵션1) 어떤 modalPresentationStyle을 지정했냐에 따라 modalTransitionStyle이 적용이 안되거나 런타임 이슈가 생기는 케이스도 존재. (pageSheet, partialCurl)
        nav.modalPresentationStyle = .fullScreen// 아래에서 위로 뜰 때 방식
        nav.modalTransitionStyle = .coverVertical // 전환 애니메이션
        
        present(nav, animated: true)
        
        // 3. 화면을 전환할 방법 선택하기 - 아래에서 위로 / modal / present
//        present(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade) // 셀 회색으로 남아있는거 없애기..
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
