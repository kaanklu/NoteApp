//
//  NAContainerView.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.07.2023.
//

import UIKit

class NAContainerView: UIView {
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private let button: CustomButton = {
        let button = CustomButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(button)
        containerStackView.addArrangedSubview(label)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension NAContainerView {
    
    func configureHeaderTitle(_ title: String) {
        self.label.text = title
    }
    
    func configureButtonTitle(_ title: String) {
        self.button.buttonTitle = title
    }
    
    func configureBackgrounColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func configureHiddenStatements(_ bool: Bool) {
        self.label.isHidden = bool
    }
}
