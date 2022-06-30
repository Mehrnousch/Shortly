//
//  LinkTableViewCell.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 21.06.22.
//

import UIKit

class LinkTableViewCell: UITableViewCell {
    
    public enum Event {
        case removeItem(data: ShorterLinkResult)
    }
    public var eventHandler: ((Event) -> Void)?
    private lazy var container = UIView().autoLayoutView()
    private lazy var originalLinkLabel = UILabel().autoLayoutView()
    lazy var deleteButton = UIButton().autoLayoutView()
    private lazy var separatorLine = UIView().autoLayoutView()
    private lazy var shorterLink = UILabel().autoLayoutView()
    lazy var copyButton = UIButton().autoLayoutView()
    
    private lazy var linkData = ShorterLinkResult()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: -deleteButton
extension LinkTableViewCell {
    
    @objc func deleteButtonPressed() {
        eventHandler?(.removeItem(data: linkData))
    }
    
  
    @objc func copySchorterLink() {
        UIPasteboard.general.string = linkData.full_short_link
    }
    
}

// MARK: - data setup cell
extension LinkTableViewCell {
    
    func setupCell(data: ShorterLinkResult) {
        originalLinkLabel.text = data.original_link
        shorterLink.text = data.full_short_link
        linkData = data
    }
}


// MARK: - SetupUI
extension LinkTableViewCell {
    func setupDefault() {
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
       copyButton.addTarget(self, action: #selector(copySchorterLink), for: .touchUpInside)
    }
    
    func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.05)
        contentView.addSubview(container)
        container.addSubview(originalLinkLabel)
        container.addSubview(deleteButton)
        container.addSubview(separatorLine)
        container.addSubview(shorterLink)
        container.addSubview(copyButton)
 
        //container
        container.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        container.layer.cornerRadius = 10
        
        
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
       
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
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
