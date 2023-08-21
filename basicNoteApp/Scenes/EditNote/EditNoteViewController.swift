//
//  EditNoteViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 16.08.2023.
//

import UIKit

class EditNoteViewController: UIViewController {
    
    let editViewModelObject = EditNoteViewModel()
    private var note: Note
    init(note: Note) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    
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
    var noteID:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        addNavigationController()
        configureUI()
        
    }
    
    func configureUI() {
        
        noteTitle.text = note.title
        noteTextview.text = note.note
        
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
        editButton.leadingToSuperview(offset: 116.5)
        editButton.trailingToSuperview(offset: 116.5)
        
    }
    
    func addNavigationController() {
        self.title = "Edit Note"
        
    }
    
    @objc func editButtonClicked() {
        var editedNote = note
        editedNote.title = noteTitle.text
        editedNote.note = noteTextview.text
        editedNote.id = note.id
        editViewModelObject.editNote(noteId: String(editedNote.id!), title: editedNote.title!, note: editedNote.note!)
        
    }
}

