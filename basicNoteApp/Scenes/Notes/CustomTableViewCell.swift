//
//  CustomTableViewCell.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 11.08.2023.
//

import UIKit
import TinyConstraints

//protocol ReuseIdentifier {
//    static var reuseIdentifier:String {get}
//}
//extension ReuseIdentifier {
//    static var reuseIdentifier:String {
//        return String(describing: Self.self)
//    }
//}

class CustomTableViewCell: UITableViewCell {
    static let identifier = String(describing: CustomTableViewCell.self)
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-SemiBold", size: 17)
        return label
    }()
    
    let noteDescriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 14)
        label.numberOfLines = 3
        label.textColor = UIColor(named: "textColor")
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(noteDescriptionLabel)
        titleLabel.topToSuperview(offset: 24,usingSafeArea: true)
        titleLabel.leadingToSuperview(offset: 24)
        titleLabel.trailingToSuperview(offset: 24)
        
        noteDescriptionLabel.topToBottom(of: titleLabel,offset: 8)
        noteDescriptionLabel.leading(to: titleLabel)
        noteDescriptionLabel.trailing(to: titleLabel)
        
       
        
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    

}
