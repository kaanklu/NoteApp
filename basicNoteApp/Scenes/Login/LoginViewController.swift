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
    var router: LoginRouter
    
    init(router: LoginRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var loginLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Inter-SemiBold", size: 26)
        label.text = "Login"
        label.textAlignment = .center
        label.textColor = UIColor(named: "textPrimary")
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
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    lazy var forgotPasswordButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor(named: "textPrimary"), for: .normal)
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
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "deepPurple")!, range: ClickableString)
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(UIColor(named: "textColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toRegisterVC), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.text = "Ggwp1@gmail.com"
        passwordTextfield.text = "1234567"
        addSubviews()
        configure()
        textfieldDelegates()

      
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
    
    
    func textfieldDelegates() {
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    func configure() {
        
        loginLabel.size(CGSize(width: 327, height: 31))
        loginLabel.topToSuperview(offset: 96, usingSafeArea: true)
        loginLabel.centerX(to: view)
        //
        
        loginLabelSubtext.size(CGSize(width: 327, height: 18))
        loginLabelSubtext.topToBottom(of: loginLabel, offset: 16)
        loginLabelSubtext.centerX(to: view)
        
        //
        emailTextfield.size(CGSize(width: 327, height: 53))
        emailTextfield.centerX(to: view)
        emailTextfield.topToBottom(of: loginLabelSubtext, offset: 40)
       //
        passwordTextfield.size(CGSize(width: 327, height: 53))
        passwordTextfield.centerX(to: view)
        passwordTextfield.topToBottom(of: emailTextfield, offset: 16)
        //
        forgotPasswordButton.size(CGSize(width: 121, height: 17))
        forgotPasswordButton.leading(to: passwordTextfield, offset: 206)
        forgotPasswordButton.topToBottom(of: passwordTextfield,offset: 4)
        //
        loginButton.size(CGSize(width: 327, height: 63))
        loginButton.topToBottom(of: passwordTextfield, offset: 50)
        loginButton.centerX(to: view)
        //
        newUserButton.size(CGSize(width: 271, height: 18))
        newUserButton.bottomToSuperview(offset: 4,usingSafeArea: true)
        newUserButton.centerX(to: view)
    }
    
    
    @objc func toRegisterVC() {
        router.placeOnRegisterViewController()
    }
    
    @objc func toForgotPasswordVC() {
        router.pushForgotPasswordViewController()
    }
    
    @objc func toNotes() {
        guard let email = emailTextfield.text,
              let password = passwordTextfield.text else { return }
        loginViewModelObject.loginRequest(email: email, password: password)
        loginViewModelObject.onLoginSuccess = { [weak self] in
            self?.router.placeOnMainVC()
        }
    }
   
}

extension LoginViewController: UITextFieldDelegate {
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let customTF = textField as? CustomTextfield {
            let isEmpty = customTF.setBorderColorWhenEmpty()
            if passwordTextfield.text != "" && emailTextfield.text != "" {
                self.loginButton.isEnabled = !isEmpty
            }
            else {
                self.loginButton.isEnabled = isEmpty
                self.loginButton.isEnabled = false
            }
        }
    }
}
