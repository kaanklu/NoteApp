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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        //profile photo part
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profile_photo"),for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(profileButtonClicked), for: .touchUpInside)
        let profileBarButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.rightBarButtonItems = [profileBarButtonItem]
        //menu part
        let menu = UIButton()
        menu.setImage(UIImage(named: "menu_icon"), for: .normal)
        menu.addTarget(self, action: #selector(emptyFunction), for: .touchUpInside)
        let menuBarButtonItem = UIBarButtonItem(customView: menu)
        navigationItem.leftBarButtonItems = [menuBarButtonItem]
        //searchBar
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
    
    
    
    
}




//extensions

extension NotesViewController : UITableViewDelegate {
    
}

extension NotesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.width(40)
        cell.height(10)
        return cell
    }
    
    
    
}

