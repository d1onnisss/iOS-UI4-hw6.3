//
//  ViewController.swift
//  iOS-UI4-hw6
//
//  Created by Alexey Lim on 26/5/24.
//

import UIKit
import SnapKit

class CreatePwdScreen: UIViewController {

    private lazy var backBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var createPwdLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New Password 🔐"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    private lazy var enterPwdLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your new password. If you forget it, then you have to do forgot password."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var pwdTF: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Enter a password"
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tag = 0
        rightView.addTarget(self, action: #selector(showPwd), for: .touchUpInside)
        
        tf.rightView = rightView
        tf.rightViewMode = .always
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 20))
        tf.leftView = leftView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    private lazy var confirmPwdLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm Password"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var confirmPwdTF: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Confirm your password"
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        tf.tag = 1
        
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tag = 1
        rightView.addTarget(self, action: #selector(showPwd), for: .touchUpInside)
        
        tf.rightView = rightView
        tf.rightViewMode = .always
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 20))
        tf.leftView = leftView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    private lazy var rememberMeBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember me"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var continueBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray4
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 18
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        pwdTF.addTarget(self, action: #selector(validatePwd), for: .editingChanged)
        confirmPwdTF.addTarget(self, action: #selector(validatePwd), for: .editingChanged)
        continueBtn.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
    }
    
    @objc private func showPwd(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            pwdTF.isSecureTextEntry = !pwdTF.isSecureTextEntry
        case 1:
            confirmPwdTF.isSecureTextEntry = !confirmPwdTF.isSecureTextEntry
        default:
            break
        }
    }
    
    @objc private func validatePwd(_ sender: UIButton) {
        guard let password = pwdTF.text,
              let confirmPassword = confirmPwdTF.text
        else { return }
        
        if password.count >= 8 && password == confirmPassword {
            continueBtn.isEnabled = true
            continueBtn.backgroundColor = .systemRed
        } else {
            continueBtn.isEnabled = false
            continueBtn.backgroundColor = .systemGray4
        }
    }
    
    @objc private func continueBtnTapped(_ sender: UIButton) {
        let vc = CustomTableView()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setupUI() {
        backBtnConfig()
        createPwdLabelConfig()
        enterPwdLabelConfig()
        pwdLabelConfig()
        pwdTFConfig()
        confirmPwdLabelConfig()
        confirmPwdTFConfig()
        rememberMeBtnConfig()
        rememberMeLabelConfig()
        continueBtnConfig()
    }
    
    private func backBtnConfig() {
        view.addSubview(backBtn)
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(32)
        }
    }
    
    private func createPwdLabelConfig() {
        view.addSubview(createPwdLabel)
        
        createPwdLabel.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func enterPwdLabelConfig() {
        view.addSubview(enterPwdLabel)
        
        enterPwdLabel.snp.makeConstraints { make in
            make.top.equalTo(createPwdLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func pwdLabelConfig() {
        view.addSubview(pwdLabel)
        
        pwdLabel.snp.makeConstraints { make in
            make.top.equalTo(enterPwdLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func pwdTFConfig() {
        view.addSubview(pwdTF)
        
        pwdTF.snp.makeConstraints { make in
            make.top.equalTo(pwdLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(38)
        }
    }
    
    private func confirmPwdLabelConfig() {
        view.addSubview(confirmPwdLabel)
        
        confirmPwdLabel.snp.makeConstraints { make in
            make.top.equalTo(pwdTF.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func confirmPwdTFConfig() {
        view.addSubview(confirmPwdTF)
        
        confirmPwdTF.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(38)
        }
    }
    
    private func rememberMeBtnConfig() {
        view.addSubview(rememberMeBtn)
        
        rememberMeBtn.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTF.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(25)
        }
    }
    
    private func rememberMeLabelConfig() {
        view.addSubview( rememberMeLabel)
        
        rememberMeLabel.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTF.snp.bottom).offset(22)
            make.leading.equalTo(rememberMeBtn.snp.trailing).offset(10)
            make.centerY.equalTo(rememberMeBtn.snp.centerY)
        }
    }
    
    private func continueBtnConfig() {
        view.addSubview(continueBtn)
        
        continueBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.width.equalTo(45)
        }
    }
}

