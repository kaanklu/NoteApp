//
//  ForgotPasswordViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 16.07.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    let forgotPasswordLabel:UILabel = UILabel()
    let forgotPasswordSubtitleLabel:UILabel = UILabel()
    let emailTextfield:UITextField = UITextField()
    let resetPassword:UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()

    }
    func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(forgotPasswordLabel)
        view.addSubview(forgotPasswordSubtitleLabel)
        view.addSubview(emailTextfield)
        view.addSubview(resetPassword)
        
        
        
    }
    
    func configure() {
        
        forgotPasswordLabel.size(CGSize(width: 327, height: 31))
        forgotPasswordLabel.topToSuperview(offset: 96, usingSafeArea: true)
        forgotPasswordLabel.leading(to: view, offset: 24)
        forgotPasswordLabel.font = UIFont(name: "Inter-SemiBold", size: 26)
        forgotPasswordLabel.text = "Forgot Password?"
        forgotPasswordLabel.textAlignment = .center
        //
        forgotPasswordSubtitleLabel.leading(to: forgotPasswordLabel)
        forgotPasswordSubtitleLabel.size(CGSize(width: 327, height: 18))
        forgotPasswordSubtitleLabel.topToBottom(of: forgotPasswordLabel, offset: 16)
        forgotPasswordSubtitleLabel.leading(to: view, offset: 24)
        forgotPasswordSubtitleLabel.textAlignment = .center
        forgotPasswordSubtitleLabel.font = UIFont(name: "Inter-Medium", size: 13)
        forgotPasswordSubtitleLabel.textColor = UIColor(named: "textColor")

        forgotPasswordSubtitleLabel.text = "Confirm your email and we'll send the instructions."
        forgotPasswordLabel.numberOfLines = 2
        //
        emailTextfield.size(CGSize(width: 327, height: 53))
        emailTextfield.leading(to: forgotPasswordSubtitleLabel)
        emailTextfield.topToBottom(of: forgotPasswordSubtitleLabel, offset: 40)
        emailTextfield.font = UIFont(name: "Inter-Medium", size: 14)
        emailTextfield.placeholder = "Email Address"
        emailTextfield.borderStyle = .roundedRect
        emailTextfield.layer.borderWidth = 1
        emailTextfield.layer.cornerRadius = 5
        emailTextfield.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        //
        resetPassword.size(CGSize(width: 327, height: 63))
        resetPassword.topToBottom(of: emailTextfield, offset: 50)
        resetPassword.leading(to: emailTextfield)
        resetPassword.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        resetPassword.setTitle("Login", for: .normal)
        resetPassword.setTitleColor(UIColor(named: "deepPurple"), for: .normal)
        resetPassword.backgroundColor = UIColor(named: "myPurple")
        resetPassword.layer.cornerRadius = 5.0
        
        
        
    }
    
    
 

}
