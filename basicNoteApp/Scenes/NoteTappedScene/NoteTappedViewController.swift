//
//  NoteTappedTableViewCell.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 11.08.2023.
//

import UIKit
import TinyConstraints


class NoteTappedViewController: UIViewController {
    lazy var noteTitle : UILabel = {
        let label = UILabel()
        label.size(CGSize(width: 327, height: 27))
        label.font = UIFont(name: "Inter-SemiBold", size: 23)
        label.textColor = UIColor(named: "titleColor")
        label.numberOfLines = 1
        return label
    }()
    
    lazy var noteTextview : UITextView = {
       let textview = UITextView()
        textview.size(CGSize(width: 327, height: 200))
        textview.font = UIFont(name: "Inter-Medium", size: 16)
        textview.textColor = UIColor(named: "textColor")
        textview.isScrollEnabled = true
        return textview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "My Note"
        view.addSubview(noteTitle)
        view.addSubview(noteTextview)
        
        noteTitle.topToSuperview(offset: 170)
        noteTitle.leadingToSuperview(offset: 24)
        noteTitle.trailingToSuperview(offset: 24)
        
        noteTextview.topToBottom(of: noteTitle,offset: 10)
        noteTextview.leadingToSuperview(offset: 24)
        noteTextview.trailingToSuperview(offset: 24)
        noteTextview.bottomToSuperview()
        

        
     
    }
    

}
