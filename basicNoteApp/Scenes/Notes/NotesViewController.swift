//
//  NotesViewController.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 20.07.2023.
//

import UIKit
import TinyConstraints



class NotesViewController: UIViewController {
    
    let notesVMObject = NotesViewModel()
    var userNoteData:Notes? = nil
    let notesTableView:UITableView = UITableView()
    private let profileButton = UIButton(type: .custom)
    
    lazy var addNoteButton: CustomButton = {
        let button = CustomButton()
        button.leftImage = UIImage(named: "plusicon")
        button.buttonTitle = "Add Note"
        button.isEnabled = true
        button.addTarget(self, action: #selector(addNote), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        addSubview()
        tableviewArrangements()
        addConstraints()
        getMyNotes()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMyNotes()
        notesTableView.reloadData()
    }
    

    
    func tableviewArrangements() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        notesTableView.rowHeight = 124
        notesTableView.edgesToSuperview()
        notesTableView.separatorStyle = .none
        notesTableView.reloadData()
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
        searchBar.delegate = self
        
        searchBar.searchBarStyle = .prominent
    }
    
    @objc func addNote() {
        self.navigationController?.pushViewController(AddNoteViewController(), animated: true)
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
    
    func getMyNotes() {
        notesVMObject.getMyNotes()
        notesVMObject.onDataReceived = { [weak self] (data:Notes) in
            self!.userNoteData = data
            self!.notesTableView.reloadData()
            print(self!.userNoteData!)
        }
    }
}




//extensions

extension NotesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let NoteTappedTableview = NoteTappedViewController()
        NoteTappedTableview.noteTitle.text = userNoteData?.data[indexPath.row].title
        NoteTappedTableview.noteTextview.text = userNoteData?.data[indexPath.row].note
        self.navigationController?.pushViewController(NoteTappedTableview, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            if let selectedRowid = self?.userNoteData?.data[indexPath.row].id {
                self?.notesVMObject.deleteMyNote(noteId: String(selectedRowid))
                self?.userNoteData?.data.remove(at: indexPath.row)
                self?.notesTableView.reloadData()

            }

            completionHandler(true)
        }
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = UIColor(named: "errorColor")
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
            
            if let userNote = self!.userNoteData?.data[indexPath.row] {
                self?.navigationController?.pushViewController(EditNoteViewController(note: userNote), animated: true)
                self?.notesTableView.reloadData()
            }

            completionHandler(true)
        }
        editAction.backgroundColor = UIColor(named: "editColor")
        editAction.image = UIImage(named: "edit")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
   
}

extension NotesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return userNoteData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier ,for:indexPath) as! CustomTableViewCell
        cell.titleLabel.text = userNoteData?.data[indexPath.row].title
        cell.noteDescriptionLabel.text = userNoteData?.data[indexPath.row].note
        return cell
    }
}

extension NotesViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
}


extension NotesViewController :UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}



