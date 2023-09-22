//
//  ForgotPasswordViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 16.07.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var router: ForgotPasswordRouter
    
    init(router: ForgotPasswordRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    let changePasswordViewModelObject = ChangePasswordViewModel()
    let forgotPasswordLabel:UILabel = {
        let label = UILabel()
        label.size(CGSize(width: 327, height: 31))
         label.font = UIFont(name: "Inter-SemiBold", size: 26)
         label.text = "Forgot Password?"
         label.textAlignment = .center
         return label
        
    }()
    
   
    
    let forgotPasswordSubtext:UILabel = {
        let label = UILabel()
        label.size(CGSize(width: 327, height: 36))
        label.font = UIFont(name: "Inter-Medium", size: 15)
        label.text = "Confirm your email and we’ll send the instructions."
        label.textAlignment = .center
        label.numberOfLines = 2
         return label
    }()
    
    lazy var emailTextfield : CustomTextfield = {
       let textfield = CustomTextfield()
        textfield.font = UIFont(name: "Inter-Medium", size: 14)
        textfield.placeholder = "Email Address"
        textfield.size(CGSize(width: 327, height: 53))
        textfield.delegate = self
        
        return textfield
    }()
    
    lazy var resetPasswordButton:CustomButton = {
       let button = CustomButton()
        button.buttonTitle = "Reset Password"
        button.size(CGSize(width: 327, height: 63))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()
        configureNavigationBar()

    }
    
    func addSubviews() {
        
        view.backgroundColor = .white
        view.addSubview(forgotPasswordLabel)
        view.addSubview(forgotPasswordSubtext)
        view.addSubview(emailTextfield)
        view.addSubview(resetPasswordButton)
        
    }
    
    func configure() {
        
        forgotPasswordLabel.topToSuperview(offset: 8,usingSafeArea: true)
        forgotPasswordLabel.leadingToSuperview(offset: 24)
        forgotPasswordLabel.trailingToSuperview(offset: 24)
        
        forgotPasswordSubtext.topToBottom(of: forgotPasswordLabel,offset: 16)
        forgotPasswordSubtext.leading(to: forgotPasswordLabel)
        forgotPasswordSubtext.trailing(to: forgotPasswordLabel)
        
        emailTextfield.topToBottom(of: forgotPasswordSubtext,offset: 40)
        emailTextfield.trailing(to: forgotPasswordLabel)
        emailTextfield.leading(to: forgotPasswordLabel)
        
        resetPasswordButton.topToBottom(of: emailTextfield,offset: 24)
        resetPasswordButton.trailing(to: emailTextfield)
        resetPasswordButton.leading(to: emailTextfield)

    }
    
    func configureNavigationBar() {
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    @objc func backButtonTapped() {
        router.placeOnLoginViewController()
    }

}
extension ForgotPasswordViewController: UITextFieldDelegate {
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let customTF = textField as? CustomTextfield {
            let isEmpty = customTF.setBorderColorWhenEmpty()
            if emailTextfield.text != "" {
                self.resetPasswordButton.isEnabled = !isEmpty
            }
            else {
                self.resetPasswordButton.isEnabled = false
            }
        }
    }
}

