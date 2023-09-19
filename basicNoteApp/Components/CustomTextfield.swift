//
//  NATextfield.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.07.2023.
//
import UIKit
import TinyConstraints

class CustomTextfield : UITextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTextfield()
        
       
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTextfield()
    }
    
    
}

extension CustomTextfield :UITextFieldDelegate{
    
    private func setTextfield() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.borderStyle = .roundedRect
        self.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        
        
    }
    
  
   
    func setBorderColorWhenEmpty() -> Bool {
        self.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        if self.text?.isEmpty ?? true {
            self.layer.borderColor = UIColor(named: "errorColor")?.cgColor
            return true
        }
        else{
            self.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            return false
        }
    }
    
}
