//
//  UserTableViewCell.swift
//  SecondApp
//
//  Created by 이빈 on 1/3/25.
//

import UIKit

// 여기는 outlet만
// action연결하면 셀 재사용으로 인해, 모든 셀의 액션이 발생할 수 있음.
class UserTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
}
