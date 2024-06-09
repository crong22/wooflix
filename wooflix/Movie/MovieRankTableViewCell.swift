//
//  MovieRankTableViewCell.swift
//  wooflix
//
//  Created by 여누 on 6/7/24.
//

import UIKit
import SnapKit

class MovieRankTableViewCell: UITableViewCell {
    static let identifier = "MovieRankTableViewCell"

    let rankLabel = UILabel()
    let movieLabel = UILabel()
    let dateLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(rankLabel)
        contentView.addSubview(movieLabel)
        contentView.addSubview(dateLabel)
        
        contentView.backgroundColor = .black
        
        
        rankLabel.backgroundColor = .white
        rankLabel.layer.borderWidth = 1
        rankLabel.textAlignment = .center
        rankLabel.font = .boldSystemFont(ofSize: 14)
        
        movieLabel.textColor = .white
        movieLabel.textAlignment = .left
        movieLabel.font = .boldSystemFont(ofSize: 14)
        
        dateLabel.textColor = .white
        dateLabel.textAlignment = .right
        dateLabel.font = .boldSystemFont(ofSize: 12)
        
        
        rankLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(5)
            make.leading.equalTo(5)
            make.width.equalTo(40)
            make.height.equalTo(25)
            
        }
        
        movieLabel.snp.makeConstraints { make in
            make.top.equalTo(3)
            make.leading.equalTo(55)
            make.trailing.equalTo(-50)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }

        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-5)
            make.trailing.equalTo(-5)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
