//
//  LoginViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 14.07.2023.
//

import UIKit
import TinyConstraints
import KeychainSwift

class LoginViewController: UIViewController {
    let loginViewModelObject = LoginViewModel()
    lazy var loginLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Inter-SemiBold", size: 26)
        label.text = "Login"
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginLabelSubtext : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 15)
        label.text = "Login or sign up to continue using our app."
        label.textAlignment = .center
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    lazy var emailTextfield : CustomTextfield = {
       let textfield = CustomTextfield()
        textfield.font = UIFont(name: "Inter-Medium", size: 14)
        textfield.placeholder = "Email Address"
        return textfield
    }()

    lazy var passwordTextfield : CustomTextfield = {
       let textfield = CustomTextfield()
        textfield.font = UIFont(name: "Inter-Medium", size: 14)
        textfield.placeholder = "Password"
        return textfield
    }()
    
    lazy var forgotPasswordButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
        button.setTitle("Forgot Password?", for: .normal)
        button.addTarget(self, action: #selector(toForgotPasswordVC), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton : CustomButton = {
        let button = CustomButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(toNotes), for: .touchUpInside)
        return button
    }()
    
    lazy var newUserButton : UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(string: "New user? Sign up now")
        let ClickableString = NSRange(location: 10, length: 11)
        attributedString.addAttribute(.link, value: "", range: ClickableString)
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toRegisterVC), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.text = "Onur1@mail.com"
        passwordTextfield.text = "123456"
        addSubviews()
        configure()

      
    }
    
    func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(loginLabel)
        view.addSubview(loginLabelSubtext)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(loginButton)
        view.addSubview(newUserButton)
        view.addSubview(forgotPasswordButton)
        
    }
    
    func configure() {
        
        loginLabel.size(CGSize(width: 327, height: 31))
        loginLabel.topToSuperview(offset: 96, usingSafeArea: true)
        loginLabel.leading(to: view, offset: 24)
       
        //
        loginLabelSubtext.leading(to: loginLabel)
        loginLabelSubtext.size(CGSize(width: 327, height: 18))
        loginLabelSubtext.topToBottom(of: loginLabel, offset: 16)
        loginLabelSubtext.leading(to: view, offset: 24)
        //
        emailTextfield.size(CGSize(width: 327, height: 53))
        emailTextfield.leading(to: loginLabelSubtext)
        emailTextfield.topToBottom(of: loginLabelSubtext, offset: 40)
       //
        passwordTextfield.size(CGSize(width: 327, height: 53))
        passwordTextfield.leading(to: emailTextfield)
        passwordTextfield.topToBottom(of: emailTextfield, offset: 16)
        //
        forgotPasswordButton.size(CGSize(width: 121, height: 17))
        forgotPasswordButton.leading(to: passwordTextfield, offset: 206)
        forgotPasswordButton.topToBottom(of: passwordTextfield,offset: 4)
        //
        loginButton.size(CGSize(width: 327, height: 63))
        loginButton.topToBottom(of: passwordTextfield, offset: 50)
        loginButton.leading(to: passwordTextfield)
        //
        newUserButton.size(CGSize(width: 271, height: 18))
        newUserButton.bottomToSuperview(offset: 4,usingSafeArea: true)
        newUserButton.leading(to: view, offset: 52)
    }
    @objc func toRegisterVC() {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    @objc func toForgotPasswordVC() {
        let forgotPasswordVC = ForgotPasswordViewController()
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
        print("succesfully forgotpassword view presented.")
    }
    @objc func toNotes() {
        guard let email = emailTextfield.text,
              let password = passwordTextfield.text else { return }
        loginViewModelObject.loginRequest(email: email, password: password)
        loginViewModelObject.onLoginSuccess = { [weak self] in
            self?.navigationController?.pushViewController(NotesViewController(), animated: true)
        }
        
        
    }
}
