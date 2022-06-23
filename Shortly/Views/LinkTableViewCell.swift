//
//  LinkTableViewCell.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 21.06.22.
//

import UIKit

class LinkTableViewCell: UITableViewCell {
    private lazy var container = UIView()
    private lazy var originalLinkLabel = UILabel()
    private lazy var deleteButton = UIButton()
    private lazy var separatorLine = UIView()
    private lazy var shorterLink = UILabel()
    private lazy var copyButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - data setup cell

extension LinkTableViewCell {
    
    func setupCell(data: LinkData) {
        originalLinkLabel.text = data.originalLink
        shorterLink.text = data.shorterLink
    }
}


// MARK: - SetupUI

extension LinkTableViewCell {
    func setupUI() {
        backgroundColor = .secondarySystemBackground
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(originalLinkLabel)
        originalLinkLabel.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(separatorLine)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(shorterLink)
        shorterLink.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(copyButton)
        copyButton.translatesAutoresizingMaskIntoConstraints = false
 
        
        //container
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 10
        //container.layer.borderColor = .init(red: 0.2, green: 0.1, blue: 0.4, alpha: 0.9)
        //container.layer.borderWidth = 1
        
        //originalLinkLabel
        
        //deleteButton
        let image = UIImage(systemName: "trash" )
        deleteButton.setImage(image, for: .normal)
        
        
        // copyButton
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        copyButton.setTitle(" Copy! ", for: .normal)
        copyButton.backgroundColor = UIColor(red: CGFloat(92/255.0), green: CGFloat(203/255.0), blue: CGFloat(207/255.0), alpha: CGFloat(1.0))
        copyButton.setTitleColor(.black, for: .normal)
        copyButton.layer.cornerRadius = 5
        copyButton.layer.borderWidth = 1
        copyButton.layer.borderColor = .init(gray: 0.9, alpha: 0.7)
        

        //separatorLine
        separatorLine.backgroundColor = .systemGray5
        
       

    
        

    }
    
    private func setupLayout() {
        
        //container
        //container.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.size.width).isActive = true
       // container.heightAnchor.constraint(equalToConstant: 200).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        //originalLinkLabel
        originalLinkLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        originalLinkLabel.trailingAnchor.constraint(equalTo: deleteButton.trailingAnchor, constant: -60).isActive = true
        originalLinkLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 25).isActive = true
        
        //deleteButton
        deleteButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        deleteButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 15).isActive = true

        
        //separatorLine
        separatorLine.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 20).isActive = true
        //separatorLine.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        //shorterLink
        shorterLink.topAnchor.constraint(equalTo: separatorLine.topAnchor, constant: 20).isActive = true
        shorterLink.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        shorterLink.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 20).isActive = true
        
        //copyButton
        copyButton.heightAnchor.constraint(equalToConstant: 44 ).isActive = true
        copyButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        copyButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        //copyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40).isActive = true
        copyButton.topAnchor.constraint(equalTo: shorterLink.topAnchor, constant: 40).isActive = true

     }
}
