//
//  CustomTableView.swift
//  iOS-UI4-hw6
//
//  Created by Alexey Lim on 26/5/24.
//

import UIKit

class CustomTableView: UIViewController {
    
    private var users: [User] = []
    
    private lazy var backBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var notifLabel: UILabel = {
        let label = UILabel()
        label.text = "Notification"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var settingsBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        setupUI()
        setupData()
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc private func backBtnTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupData() {
        users =
        [
            User(logo: "Jane",
                 userLabel: "Jane Cooper has published a new recipe!",
                 dateAndTime: "Today | 09:24 AM",
                 recipeimage: "JaneRecipe"),
            User(logo: "Rochel",
                 userLabel: "Rochel has commented on your recipe",
                 dateAndTime: "1 day ago | 14:43 PM",
                 recipeimage: "RochelRecipe"),
            User(logo: "Brad",
                 userLabel: "Brad Wigington liked your comment",
                 dateAndTime: "1 day ago | 09:29 AM",
                 recipeimage: "BradRecipe"),
            User(logo: "Tyra",
                 userLabel: "Tyra Ballentine has published a new recipe!",
                 dateAndTime: "2 days ago | 10:29 AM",
                 recipeimage: "TyraRecipe"),
            User(logo: "Marci",
                 userLabel: "Marci Winkles has published a new recipe!",
                 dateAndTime: "3 days ago | 16:52 PM",
                 recipeimage: "MarciRecipe"),
            User(logo: "Aileen",
                 userLabel: "Aileen has commented on your recipe",
                 dateAndTime: "4 days ago | 14:27 PM",
                 recipeimage: "AileenRecipe"),
            User(logo: "George",
                 userLabel: "George has commented on your recipe",
                 dateAndTime: "5 days ago | 9:20 AM",
                 recipeimage: "GeorgeRecipe"),
        ]
    }
    
    private func setupUI() {
        backBtnConfig()
        notifLabelConfig()
        settingsBtnConfig()
        tableViewConfig()
    }
    
    private func backBtnConfig() {
        view.addSubview(backBtn)
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(32)
        }
    }
    
    private func notifLabelConfig() {
        view.addSubview(notifLabel)
        
        notifLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(backBtn.snp.centerY)
            make.leading.equalTo(backBtn.snp.trailing).offset(10)
        }
    }
    
    private func settingsBtnConfig() {
        view.addSubview(settingsBtn)
        
        settingsBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(notifLabel.snp.centerY)
            make.width.height.equalTo(32)
        }
    }
    
    private func tableViewConfig() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(notifLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension CustomTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setCellData(logo: users[indexPath.row].logo, userLabelText: users[indexPath.row].userLabel, dateAndTime: users[indexPath.row].dateAndTime, recipeImageName: users[indexPath.row].recipeimage)
        
        return cell
    }
}
