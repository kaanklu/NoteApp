//
//  EditNoteViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 16.08.2023.
//

import UIKit

class EditNoteViewController: UIViewController {
    
    var note:Note? = nil
    var router: EditNoteRouter
    
    init(router: EditNoteRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let editViewModelObject = EditNoteViewModel()
    
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
    
    lazy var editButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("Save", for: .normal)
        button.size(CGSize(width: 142, height: 41))
        button.isEnabled = true
        button.addTarget(self, action: #selector(editButtonClicked), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        addNavigationController()
        textfieldControl()
        
    }

    
    func addSubviews() {
        view.addSubview(noteTitle)
        view.addSubview(noteTextview)
        view.addSubview(editButton)
        
    }
    
    
    func addConstraints() {
        noteTitle.topToSuperview(offset: 135)
        noteTitle.leadingToSuperview(offset: 24)
        noteTitle.trailingToSuperview(offset: 24)
        
        noteTextview.topToBottom(of: noteTitle,offset: 3)
        noteTextview.leading(to: noteTitle)
        noteTextview.trailing(to: noteTitle)
        
        editButton.topToBottom(of: noteTextview,offset: 22)
        editButton.centerX(to: view)
        
    }
    
    func addNavigationController() {
        self.title = "Edit Note"
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    
    }
    
    func textfieldControl() {
        if let note = note {
            noteTitle.text = note.title
            noteTextview.text = note.note
        }
        else {
            noteTitle.text = ""
            noteTextview.text = ""
        }
    }
    
    @objc func backButtonTapped() {
        router.placeOnMainVC()
    
    }
    
    @objc func editButtonClicked() {
        if noteTitle.text != "" && noteTextview.text != "" {
            if let editedTitle = noteTitle.text,
               let editedNote = noteTextview.text,
               let editedId = note?.id {
                editViewModelObject.editNote(noteId: String(editedId), title: editedTitle, note: editedNote)
                router.placeOnMainVC()
                
            }
        }
    }
}

