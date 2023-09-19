//
//  ChangePasswordViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 21.08.2023.
//

import UIKit
import TinyConstraints

class ChangePasswordViewController: UIViewController {
    
    
    var router: ChangePasswordRouter
    
    init(router: ChangePasswordRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let changePasswordViewModelObject = ChangePasswordViewModel()
    
    private lazy var passwordTextfield : CustomTextfield = {
        let passwordTf = CustomTextfield()
        passwordTf.size(CGSize(width: 329, height: 50))
        passwordTf.placeholder = "Password"
        passwordTf.isSecureTextEntry = true
        return passwordTf
    }()
    
    private lazy var newPasswordTextfield : CustomTextfield = {
        let passwordTf = CustomTextfield()
        passwordTf.size(CGSize(width: 329, height: 50))
        passwordTf.placeholder = "New Password"
        passwordTf.isSecureTextEntry = true
        return passwordTf
    }()
    
    private lazy var retypeNewPasswordTextfield : CustomTextfield = {
        let passwordTf = CustomTextfield()
        passwordTf.size(CGSize(width: 329, height: 50))
        passwordTf.placeholder = "New Password Confirmation"
        passwordTf.isSecureTextEntry = true
        return passwordTf
    }()
    
    private lazy var saveButton : CustomButton = {
        let button = CustomButton()
        button.size(CGSize(width: 327, height: 63))
        button.buttonTitle = "Save"
        button.addTarget(self, action: #selector(changePasswordTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBar()
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        textfieldDelegates()

    }
    
    func addNavBar() {
        self.title = "Change Password"
        let menu = UIButton()
        menu.setImage(UIImage(named: "menu_icon"), for: .normal)
        menu.addTarget(self, action: #selector(toNotesVC), for: .touchUpInside)
        let menuBarButtonItem = UIBarButtonItem(customView: menu)
        navigationItem.leftBarButtonItems = [menuBarButtonItem]

    }
    
    @objc func toNotesVC() {
        router.placeOnMainVC()
    }
 
    func addSubviews() {
        view.addSubview(passwordTextfield)
        view.addSubview(newPasswordTextfield)
        view.addSubview(retypeNewPasswordTextfield)
        view.addSubview(saveButton)
    }
    
    func textfieldDelegates() {
        passwordTextfield.delegate = self
        newPasswordTextfield.delegate = self
        retypeNewPasswordTextfield.delegate = self
    }
    
    @objc func changePasswordTapped() {
        guard let pw1 = passwordTextfield.text,
              let pw2 = newPasswordTextfield.text,
              let pw3 = retypeNewPasswordTextfield.text
        else {return}
        print("tapped")
        changePasswordViewModelObject.changePasswordRequest(password: pw1, newpassword: pw2, retypepassword: pw3, accessToken: keyChain.get("access_token")!)
        router.placeOnMainVC()
    }
    
    func addConstraints() {
        passwordTextfield.topToSuperview(offset:24,usingSafeArea: true)
        passwordTextfield.leadingToSuperview(offset:22)
        passwordTextfield.trailingToSuperview(offset:22)
        
        newPasswordTextfield.topToBottom(of: passwordTextfield,offset: 16)
        newPasswordTextfield.leading(to: passwordTextfield)
        newPasswordTextfield.trailing(to: passwordTextfield)
        
        retypeNewPasswordTextfield.topToBottom(of: newPasswordTextfield,offset: 16)
        retypeNewPasswordTextfield.leading(to: newPasswordTextfield)
        retypeNewPasswordTextfield.trailing(to: newPasswordTextfield)
        
        saveButton.topToBottom(of: retypeNewPasswordTextfield,offset: 24)
        saveButton.leading(to: retypeNewPasswordTextfield)
        saveButton.trailing(to: retypeNewPasswordTextfield)
        
    }
}

extension ChangePasswordViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let customTF = textField as? CustomTextfield {
            let isEmpty = customTF.setBorderColorWhenEmpty()
            if passwordTextfield.text != "" && newPasswordTextfield.text != "" && retypeNewPasswordTextfield.text != "" {
                self.saveButton.isEnabled = !isEmpty
            }
            else {
                self.saveButton.isEnabled = isEmpty
            }
        }
    }
}
