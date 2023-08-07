//
//  NotesViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 20.07.2023.
//

import UIKit
import TinyConstraints
class NotesViewController: UIViewController {
    
    let notesTableView:UITableView = UITableView()
    private let profileButton = UIButton(type: .custom)
    lazy var addNoteButton: CustomButton = {
        let button = CustomButton()
        button.leftImage = UIImage(named: "plusicon")
        button.buttonTitle = "Add Note"
        button.isEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        addSubview()
        tableviewArrangements()
        addConstraints()

    }
    
    func tableviewArrangements() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        notesTableView.rowHeight = 124
        notesTableView.edgesToSuperview()

    }
    
    func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profile_photo"),for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(profileButtonClicked), for: .touchUpInside)
        let profileBarButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.rightBarButtonItems = [profileBarButtonItem]
        
        let menu = UIButton()
        menu.setImage(UIImage(named: "menu_icon"), for: .normal)
        menu.addTarget(self, action: #selector(emptyFunction), for: .touchUpInside)
        let menuBarButtonItem = UIBarButtonItem(customView: menu)
        navigationItem.leftBarButtonItems = [menuBarButtonItem]
        
        let searchBar = UISearchBar()
        self.navigationItem.titleView = searchBar
        searchBar.size(CGSize(width: 231, height: 40),isActive: true)
        searchBar.placeholder = "Search..."
     
    }
    
    @objc func profileButtonClicked() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)

    }
    @objc func emptyFunction() {
    }
    
    func addSubview() {
        view.addSubview(notesTableView)
        view.addSubview(addNoteButton)
    }
    func addConstraints() {
        addNoteButton.size(CGSize(width: 142, height: 41))
        addNoteButton.topToSuperview(offset: 713)
        addNoteButton.leadingToSuperview(offset: 116.5)
        addNoteButton.trailingToSuperview(offset: 116.5)
        
    }
}




//extensions

extension NotesViewController : UITableViewDelegate {
        
}

extension NotesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" ,for:indexPath)
        cell.textLabel?.text = "test"
        cell.textLabel?.textColor = .black
        return cell
    }
}

