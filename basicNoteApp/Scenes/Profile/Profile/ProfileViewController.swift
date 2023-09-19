//
//  ProfileViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 25.07.2023.
//

import UIKit
import TinyConstraints

class ProfileViewController: UIViewController {
    
    let profileViewModelObject = ProfileViewModel()
    
    var router:ProfileRouter
    init(router: ProfileRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var signoutButton : UIButton = {
       let btn = UIButton()
        btn.setTitle("Sign Out", for: .normal)
        btn.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 14)
        btn.addTarget(self, action: #selector(signoutButtonClicked), for: .touchUpInside)
        return btn
    }()
    
    private lazy var customButton: CustomButton = {
        let btn = CustomButton()
        btn.buttonFont = UIFont(name: "Inter-SemiBold", size: 16)
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var nameCustomTextfield : CustomTextfield = {
        let fullnameTextfield = CustomTextfield()
        return fullnameTextfield
    }()
    
    private lazy var emailCustomTextfield : CustomTextfield = {
        let emailTextfield = CustomTextfield()
        return emailTextfield
    }()
    
    private lazy var changePasswordButton : UIButton = {
        let button = UIButton()
        button.size(CGSize (width: 123, height: 17))
        button.setTitleColor(UIColor(named: "signupFill"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 14)
        button.setTitle("Change Password", for: .normal)
        button.addTarget(self, action: #selector(toChangePasswordVC), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        addSubviews()
        addConstraints()
        
    }
    
    @objc func signoutButtonClicked() {
        router.placeOnLoginViewController()
    }
    
    func addSubviews() {
        view.addSubview(nameCustomTextfield)
        view.addSubview(emailCustomTextfield)
        view.addSubview(customButton)
        view.addSubview(changePasswordButton)
        view.addSubview(signoutButton)
        
    }
    
    func addConstraints() {
        
        nameCustomTextfield.size(CGSize(width: 327, height: 53))
        nameCustomTextfield.topToSuperview(offset: 24,usingSafeArea: true)
        nameCustomTextfield.centerX(to: view)
        nameCustomTextfield.placeholder = "Full Name"
        nameCustomTextfield.delegate = self
        
        emailCustomTextfield.size(CGSize(width: 327, height: 53))
        emailCustomTextfield.topToBottom(of: nameCustomTextfield,offset: 16)
        emailCustomTextfield.centerX(to: view)
        emailCustomTextfield.placeholder = "Email"
        emailCustomTextfield.delegate = self

        customButton.size(CGSize(width: 327, height: 63))
        customButton.topToBottom(of: emailCustomTextfield,offset: 16)
        customButton.centerX(to: view)
        
        changePasswordButton.topToBottom(of: customButton,offset: 16)
        changePasswordButton.centerX(to: view)
        
        signoutButton.size(CGSize (width: 123, height: 17))
        signoutButton.topToBottom(of: changePasswordButton,offset: 16)
        signoutButton.centerX(to: view)
        
        
        
    }
    
    
    
    func setNavigationBar() {
        let menu = UIButton()
        menu.setImage(UIImage(named: "menu_icon"), for: .normal)
        menu.addTarget(self, action: #selector(valotile), for: .touchUpInside)
        let menuBarButtonItem = UIBarButtonItem(customView: menu)
        navigationItem.leftBarButtonItems = [menuBarButtonItem]
        
    }
    
    @objc func toChangePasswordVC() {
        router.placeOnChangePasswordViewController()
    }
    
    @objc func saveButtonClicked() {
        guard let fullname = nameCustomTextfield.text,
              let email = emailCustomTextfield.text else {return}
        
        profileViewModelObject.updateMe(accessToken: keyChain.get("access_token")!, fullname: fullname, email: email)
        
    }
    
    @objc func valotile() {
        router.placeOnMainVC()
    }
}

extension ProfileViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let customTF = textField as? CustomTextfield {
            let isEmpty = customTF.setBorderColorWhenEmpty()
            if emailCustomTextfield.text != "" && nameCustomTextfield.text != "" {
                self.customButton.isEnabled = !isEmpty
            }
            else {
                self.customButton.isEnabled = false
            }
        }
    }
}
