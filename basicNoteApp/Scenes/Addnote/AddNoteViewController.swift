//
//  Add&EditNote.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 10.08.2023.
//

import UIKit
import TinyConstraints

class AddNoteViewController: UIViewController {
    lazy var noteTitle : UITextField = {
        let textfield = UITextField()
        textfield.size(CGSize(width: 327, height: 27))
        textfield.font = UIFont(name: "Inter-SemiBold", size: 23)
        textfield.textColor = UIColor(named: "titleColor")
        textfield.placeholder = "Başlık"
        return textfield
    }()
    
    lazy var noteTextview : UITextView = {
       let textview = UITextView()
        textview.size(CGSize(width: 327, height: 200))
        textview.font = UIFont(name: "Inter-Medium", size: 16)
        textview.textColor = UIColor(named: "textColor")
        textview.isScrollEnabled = true
        textview.text = "descč"
        return textview
    }()
    lazy var saveButton:CustomButton = {
       let button = CustomButton()
        button.setTitle("Save", for: .normal)
        button.size(CGSize(width: 142, height: 41))
        button.isEnabled = true
        button.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        return button
    }()
    var noteId:Int = 0
    let addNoteViewModelObject = AddNoteViewModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        addNavigationController()

        
    }
    
    func addSubviews() {
        view.addSubview(noteTitle)
        view.addSubview(noteTextview)
        view.addSubview(saveButton)
        
    }
    
    func addConstraints() {
        noteTitle.topToSuperview(offset: 135)
        noteTitle.leadingToSuperview(offset: 24)
        noteTitle.trailingToSuperview(offset: 24)
        
        noteTextview.topToBottom(of: noteTitle,offset: 3)
        noteTextview.leading(to: noteTitle)
        noteTextview.trailing(to: noteTitle)
        
        saveButton.topToBottom(of: noteTextview,offset: 22)
        saveButton.leadingToSuperview(offset: 116.5)
        saveButton.trailingToSuperview(offset: 116.5)

    }
    func addNavigationController() {
        self.title = "Add Note"
        
    }
    
   
    @objc func saveButtonClicked() {
        if noteTitle.text != "" && noteTextview.text != "" {
            addNoteViewModelObject.editNote(title: noteTitle.text!, note: noteTextview.text!)
        }
        else { return }
    }
 
}

