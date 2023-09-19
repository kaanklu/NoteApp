//
//  RegisterViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 13.07.2023.
//

import UIKit
import TinyConstraints
import KeychainSwift
class RegisterViewController: UIViewController {
    
    let registerViewModalObject = RegisterViewModel()
    
    var router: RegisterRouter
    
    init(router: RegisterRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var signupLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-SemiBold", size: 26)
        label.text = "Sign Up"
        return label
    }()
    
    private lazy var signupLabelSubtext : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 15)
        label.text = "Login or sign up to continue using our app."
        return label
    }()
    
    private lazy var signupButton: CustomButton = {
        let btn = CustomButton()
        btn.buttonTitle = "Sign Up"
        btn.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        return btn
    }()
    
    private lazy var nameTextfield : CustomTextfield = {
        let textfield = CustomTextfield()
        textfield.placeholder = "Full Name"
        textfield.delegate = self
        return textfield
    }()
    
    private lazy var emailTextfield : CustomTextfield = {
        let textfield = CustomTextfield()
        textfield.placeholder = "Email Address"
        textfield.delegate = self
        return textfield
    }()
    
    private lazy var passwordTextfield : CustomTextfield = {
        let textfield = CustomTextfield()
        textfield.font = UIFont(name: "Inter-Medium", size: 14)
        textfield.placeholder = "Password"
        textfield.text = "fdsfdasfdsaf"
        textfield.delegate = self
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    lazy var haveAccountButton :UIButton = {
        let btn = UIButton()
        btn.isUserInteractionEnabled = true
        btn.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        let attributedString = NSMutableAttributedString(string: "Already have an account? Sign in now")
        let clickableString = NSRange(location: 25, length: 11)
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "deepPurple")! , range: clickableString)
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.setTitleColor(UIColor(named: "textColor"), for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(toLoginVC), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(passwordTextfield.text!)
        addSubviews()
        configureConstraints()
    }
    
    @objc func toLoginVC() {
        router.placeOnLoginViewController()
    }
    
    fileprivate func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(signupLabel)
        view.addSubview(signupLabelSubtext)
        view.addSubview(nameTextfield)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(signupButton)
        view.addSubview(haveAccountButton)
    }
    
    func configureConstraints() {
        
        signupLabel.size(CGSize(width: 327, height: 31))
        signupLabel.topToSuperview(offset: 96,usingSafeArea: true)
        signupLabel.centerX(to: view)
        //
        signupLabelSubtext.size(CGSize(width: 327, height: 18))
        signupLabelSubtext.topToBottom(of: signupLabel,offset: 16)
        signupLabelSubtext.centerX(to: view)
        //
        nameTextfield.size(CGSize(width: 327, height: 53))
        nameTextfield.topToBottom(of: signupLabelSubtext,offset: 16)
        nameTextfield.centerX(to: view)
        //
        emailTextfield.size(CGSize(width: 327, height: 53))
        emailTextfield.topToBottom(of: nameTextfield,offset: 16)
        emailTextfield.centerX(to: view)
        //
        passwordTextfield.size(CGSize(width: 327, height: 53))
        passwordTextfield.topToBottom(of: emailTextfield,offset: 16)
        passwordTextfield.centerX(to: view)
        //
        signupButton.size(CGSize(width: 327, height: 63))
        signupButton.topToBottom(of: passwordTextfield,offset: 24)
        signupButton.centerX(to: view)
        //
        haveAccountButton.size(CGSize(width: 271, height: 18))
        haveAccountButton.bottomToSuperview(offset: 4,usingSafeArea: true)
        haveAccountButton.centerX(to: view)
    }
    
    func setButtonTargets() {
        haveAccountButton.addTarget(self, action: #selector(toLoginVC), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }
    
    @objc func registerButtonClicked() {
          guard let email = emailTextfield.text,
                let name = nameTextfield.text,
                let password = passwordTextfield.text else {
              return
          }
        registerViewModalObject.registerRequest(name: name, email: email, password: password)
        
        }
}

extension RegisterViewController: UITextFieldDelegate {
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let customTF = textField as? CustomTextfield {
            let isEmpty = customTF.setBorderColorWhenEmpty()
            if passwordTextfield.text != "" && emailTextfield.text != "" {
                self.signupButton.isEnabled = !isEmpty
            }
            else {
                self.signupButton.isEnabled = false
            }
        }
    }
}


