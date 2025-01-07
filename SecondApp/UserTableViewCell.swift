//
//  UserTableViewCell.swift
//  SecondApp
//
//  Created by 이빈 on 1/3/25.
//

import UIKit
import Kingfisher

// 여기는 outlet만
// action연결하면 셀 재사용으로 인해, 모든 셀의 액션이 발생할 수 있음.
class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    // 스토리보드로 구현한 경우에만 실행되는 메서드,
    // 같은 역할을 하는 다른 메서드가 존재(코드베이스)
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        profileImageView.image = UIImage(systemName: "star")
    }
    
    private func configure() {
        print(#function)
        profileImageView.backgroundColor = .brown
        
        nameLabel.font = .boldSystemFont(ofSize: 15)
        messageLabel.font = .systemFont(ofSize: 13)
        messageLabel.numberOfLines = 0
    }
    
    func configureData(row: Friends) {
        print(#function)
        
        nameLabel.text = row.nameDescription
        messageLabel.text = row.message
        
        let image = row.profile_image
        
        if let image {
            let url = URL(string: image)
            profileImageView.kf.setImage(with: url)
        }
//        else {
//            profileImageView.image = UIImage(systemName: "person")
//        }
        
        let name = row.like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: name), for: .normal)
        
    }
    
}
