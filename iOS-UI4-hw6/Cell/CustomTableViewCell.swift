//
//  CustomTableViewCell.swift
//  iOS-UI4-hw6
//
//  Created by Alexey Lim on 27/5/24.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 24
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var dateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let recipeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    private let threeDotsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "threeDots")
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.height.equalTo(80)
        }
        
        containerView.addSubview(logoImage)
        containerView.addSubview(userLabel)
        containerView.addSubview(dateAndTimeLabel)
        containerView.addSubview(recipeImage)
        containerView.addSubview(threeDotsImage)
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(60)
            make.centerY.equalToSuperview()
        }
        
        userLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(logoImage.snp.trailing).offset(10)
            make.trailing.equalTo(recipeImage.snp.leading).offset(-10)
        }
        
        dateAndTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(userLabel.snp.bottom).offset(5)
            make.leading.equalTo(userLabel.snp.leading)
        }
        
        recipeImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(72)
        }
        
        threeDotsImage.snp.makeConstraints { make in
            make.centerY.equalTo(recipeImage.snp.centerY)
            make.leading.equalTo(recipeImage.snp.trailing).offset(10)
            make.width.height.equalTo(24)
        }
    }
    
    func setCellData(logo: String, userLabelText: String, dateAndTime: String, recipeImageName: String) {
        logoImage.image = UIImage(named: logo)
        userLabel.text = userLabelText
        dateAndTimeLabel.text = dateAndTime
        recipeImage.image = UIImage(named: recipeImageName)
    }
}
