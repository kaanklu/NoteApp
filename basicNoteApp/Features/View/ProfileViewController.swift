//
//  ProfileViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 25.07.2023.
//

import UIKit
import TinyConstraints

class ProfileViewController: UIViewController {
    
    
    private lazy var customButton: CustomButton = {
        let btn = CustomButton()
        btn.buttonFont = UIFont(name: "Inter-SemiBold", size: 16)
        btn.buttonTitle = "Save"
        btn.isEnabled = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        self.title = "Profile"
        
    }
    
    func addSubviews() {
        view.addSubview(nameCustomTextfield)
        view.addSubview(emailCustomTextfield)
        view.addSubview(customButton)
        
    }
    
    func addConstraints() {
        
        nameCustomTextfield.size(CGSize(width: 327, height: 53))
        nameCustomTextfield.topToSuperview(offset: 24,usingSafeArea: true)
        nameCustomTextfield.leadingToSuperview(offset: 24)
        nameCustomTextfield.trailingToSuperview(offset: 24)
        nameCustomTextfield.placeholder = "Full Name"
        nameCustomTextfield.delegate = self
        
        emailCustomTextfield.size(CGSize(width: 327, height: 53))
        emailCustomTextfield.topToBottom(of: nameCustomTextfield,offset: 16)
        emailCustomTextfield.leading(to: nameCustomTextfield)
        emailCustomTextfield.trailing(to: nameCustomTextfield)
        emailCustomTextfield.placeholder = "Email"
        emailCustomTextfield.delegate = self

        customButton.size(CGSize(width: 327, height: 63))
        customButton.topToBottom(of: emailCustomTextfield,offset: 16)
        customButton.leading(to: emailCustomTextfield)
        customButton.trailing(to: emailCustomTextfield)
        
        
    }
    
    func setNavigationBar() {
        let menu = UIButton()
        menu.setImage(UIImage(named: "menu_icon"), for: .normal)
        menu.addTarget(self, action: #selector(valotile), for: .touchUpInside)
        let menuBarButtonItem = UIBarButtonItem(customView: menu)
        navigationItem.leftBarButtonItems = [menuBarButtonItem]
        
        
    }
    
    @objc func valotile() {}
   
    
}

extension ProfileViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let customTF = textField as? CustomTextfield {
            let isEmpty = customTF.setBorderColorWhenEmpty()
            self.customButton.isEnabled = !isEmpty
    
        }
    }
}
