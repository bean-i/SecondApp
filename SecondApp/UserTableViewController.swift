//
//  UserTableViewController.swift
//  SecondApp
//
//  Created by 이빈 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewController: UITableViewController {
    
    let friends = FriendsInfo().list
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
//        print() // 다른 속성
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        let row = friends[indexPath.row]
        let image = row.profile_image
        
        if let image {
            let url = URL(string: image)
            cell.profileImageView.kf.setImage(with: url)
        } else {
            cell.profileImageView.image = UIImage(systemName: "person")
        }
        
        let name = row.like ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: name), for: .normal)
        
//        if row.like {
//            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        } else {
//            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        }
        
        cell.nameLabel.text = row.name
        cell.messageLabel.text = row.message
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 15)
        cell.messageLabel.font = .systemFont(ofSize: 13)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    

}
