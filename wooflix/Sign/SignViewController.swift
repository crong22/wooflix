//
//  SignViewController.swift
//  wooflix
//
//  Created by 여누 on 6/5/24.
//

import UIKit
import SnapKit

class SignViewController: UIViewController {

    let titleLabel = UILabel()
    
    let mainTextView = UIView()
    
    let emailTextField = UITextField()
    let pwTextField = UITextField()
    let nicknameTextField = UITextField()
    let gpsTextField = UITextField()
    let recommendTextFiled = UITextField()
    let signButton = UIButton()
    
    let subTitleLabel = UILabel()
    let mainSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureUI()
        configureLayout()
    }

    func configureHierarchy() {
        let list = [titleLabel, mainTextView]
        
        for i in list {
            view.addSubview(i)
        }
        
        mainTextView.addSubview(emailTextField)
        mainTextView.addSubview(pwTextField)
        mainTextView.addSubview(nicknameTextField)
        mainTextView.addSubview(gpsTextField)
        mainTextView.addSubview(recommendTextFiled)
        mainTextView.addSubview(signButton)
        mainTextView.addSubview(subTitleLabel)
        mainTextView.addSubview(mainSwitch)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(45)
        }
        
        mainTextView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).inset(180)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
            make.height.equalTo(350)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(35)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(35)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(35)
        }
        
        gpsTextField.snp.makeConstraints { make in
            make.top.equalTo(150)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(35)
        }
        
        recommendTextFiled.snp.makeConstraints { make in
            make.top.equalTo(200)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(35)
        }
        
        signButton.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(40)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.leading.equalTo(-2)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        mainSwitch.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.trailing.equalTo(0)
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        titleLabel.text = "WOOFLIX"
        titleLabel.font = .systemFont(ofSize: 27, weight: .heavy)
        titleLabel.textColor = .red
        titleLabel.textAlignment = .center
        
        emailTextField.backgroundColor = .gray
        emailTextField.layer.cornerRadius = 5
        emailTextField.text = "이메일 주소 또는 전화번호"
        emailTextField.textColor = .white
        emailTextField.font = .systemFont(ofSize: 13)
        emailTextField.textAlignment = .center
        
        pwTextField.backgroundColor = .gray
        pwTextField.layer.cornerRadius = 5
        pwTextField.text = "비밀번호"
        pwTextField.textColor = .white
        pwTextField.font = .systemFont(ofSize: 13)
        pwTextField.textAlignment = .center
        
        nicknameTextField.backgroundColor = .gray
        nicknameTextField.layer.cornerRadius = 5
        nicknameTextField.text = "닉네임"
        nicknameTextField.textColor = .white
        nicknameTextField.font = .systemFont(ofSize: 13)
        nicknameTextField.textAlignment = .center
        
        gpsTextField.backgroundColor = .gray
        gpsTextField.layer.cornerRadius = 5
        gpsTextField.text = "위치"
        gpsTextField.textColor = .white
        gpsTextField.font = .systemFont(ofSize: 13)
        gpsTextField.textAlignment = .center
        
        recommendTextFiled.backgroundColor = .gray
        recommendTextFiled.layer.cornerRadius = 5
        recommendTextFiled.text = "추천 코드 입력"
        recommendTextFiled.textColor = .white
        recommendTextFiled.font = .systemFont(ofSize: 13)
        recommendTextFiled.textAlignment = .center
        
        signButton.backgroundColor = .white
        signButton.setTitle("회원가입", for: .normal)
        signButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        signButton.setTitleColor(.black, for: .normal)
        signButton.layer.cornerRadius = 5
        signButton.clipsToBounds = true
        
        subTitleLabel.text = "추가 정보 입력"
        subTitleLabel.font = .boldSystemFont(ofSize: 14)
        subTitleLabel.textAlignment = .left
        subTitleLabel.textColor = .white
        
        
        mainSwitch.onTintColor = .red
        mainSwitch.tintColor = .gray
        
    }

}
