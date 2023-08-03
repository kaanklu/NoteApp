//
//  RegisterViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 13.07.2023.
//

import UIKit
import TinyConstraints
import KeychainSwift
class RegisterViewController: UIViewController,UITextFieldDelegate {

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
        btn.isEnabled = false
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
        textfield.delegate = self
        return textfield
    }()
    lazy var haveAccountButton :UIButton = {
        let btn = UIButton()
        btn.isUserInteractionEnabled = true
        btn.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        let attributedString = NSMutableAttributedString(string: "Already have an account? Sign in now")
        let clickableString = NSRange(location: 25, length: 11)
        attributedString.addAttribute(.link, value: "" , range: clickableString)
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(toLoginVC), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        addSubviews()
        configureConstraints()
    }
    
    @objc func toLoginVC() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(loginVC, animated: true)
        print("sucCeS")
    }
    
    func alreadyhaveacc() {
        let destinationVC = LoginViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(destinationVC, animated: true)
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
        signupLabel.leadingToSuperview(offset: 24)
        signupLabel.trailingToSuperview(offset: 24)
        //
        signupLabelSubtext.size(CGSize(width: 327, height: 18))
        signupLabelSubtext.topToBottom(of: signupLabel,offset: 16)
        signupLabelSubtext.leading(to: signupLabel)
        signupLabelSubtext.trailing(to: signupLabel)
        //
        nameTextfield.size(CGSize(width: 327, height: 53))
        nameTextfield.topToBottom(of: signupLabelSubtext,offset: 16)
        nameTextfield.leading(to: signupLabelSubtext)
        nameTextfield.trailing(to: signupLabelSubtext)
        //
        emailTextfield.size(CGSize(width: 327, height: 53))
        emailTextfield.topToBottom(of: nameTextfield,offset: 16)
        emailTextfield.leading(to: nameTextfield)
        emailTextfield.trailing(to: nameTextfield)
        //
        passwordTextfield.size(CGSize(width: 327, height: 53))
        passwordTextfield.topToBottom(of: emailTextfield,offset: 16)
        passwordTextfield.leading(to: emailTextfield)
        passwordTextfield.trailing(to: emailTextfield)
        //
        signupButton.size(CGSize(width: 327, height: 63))
        signupButton.topToBottom(of: passwordTextfield,offset: 24)
        signupButton.leading(to: passwordTextfield)
        signupButton.trailing(to: passwordTextfield)
        //
        haveAccountButton.size(CGSize(width: 271, height: 18))
        haveAccountButton.bottomToSuperview(offset: 4,usingSafeArea: true)
        haveAccountButton.leading(to: signupButton,offset:28)
    }
    
    func setButtonTargets() {
        haveAccountButton.addTarget(self, action: #selector(toLoginVC), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }
    
    @objc func registerButtonClicked() {
        
        guard let name = self.nameTextfield.text else {return}
        guard let email = self.emailTextfield.text else {return}
        guard let password = self.passwordTextfield.text else {return}
        let register = RegisterModel(full_name: name, email: email, password: password)
        APIManager.shareInstance.callRegisterAPI(userRegister: register) { (isSucces) in
            DispatchQueue.main.async {
                if isSucces {
                        self.toastMessege(messege: "olduddd")
                    }
                    else {
                        self.toastMessege(messege: "olmadii")
                    }
            }
            }
        }
    
    func toastMessege(messege:String) {
        let makeAlert = UIAlertController(title: "Uyarı", message: messege, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .cancel)
        makeAlert.addAction(okButton)
        present(makeAlert, animated: true)
    }
}
