//
//  LinkTableViewCell.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 21.06.22.
//

import UIKit

class LinkTableViewCell: UITableViewCell {
    
    public enum Event {
        case removeItem(data: ShorterLinkData)
        
    }
    public var eventHandler: ((Event) -> Void)?
    
    private lazy var container = UIView().autoLayoutView()
    private lazy var originalLinkLabel = UILabel().autoLayoutView()
    private lazy var deleteButton = UIButton().autoLayoutView()
    private lazy var separatorLine = UIView().autoLayoutView()
    private lazy var shorterLink = UILabel().autoLayoutView()
    private lazy var copyButton = UIButton().autoLayoutView()
    
    private lazy var linkData = ShorterLinkData()

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
}

//MARK: -copyButton
extension LinkTableViewCell {
    
    @objc func copyShorterLink() {
          UIPasteboard.general.string = linkData.full_short_link
      }
}
 
// MARK: - data setup cell
extension LinkTableViewCell {
    
    func setupCell(data: ShorterLinkData) {
        originalLinkLabel.text = data.original_link
        shorterLink.text = data.full_short_link
        linkData = data
    }
}

// MARK: - SetupUI

extension LinkTableViewCell {
    func setupDefault() {
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
       copyButton.addTarget(self, action: #selector(copyShorterLink), for: .touchUpInside)
    }
    
    func setupUI() {
        backgroundColor = UIColor.systemBackground
        contentView.addSubview(container)
        container.addSubview(originalLinkLabel)
        container.addSubview(deleteButton)
        container.addSubview(separatorLine)
        container.addSubview(shorterLink)
        container.addSubview(copyButton)
 
        //container
        container.backgroundColor = UIColor.secondarySystemBackground
        container.layer.cornerRadius = 10
        
        //originalLinkLabel
        originalLinkLabel.textColor = .label
        let originalLinkLabelFontSize = self.originalLinkLabel.font.pointSize;
        originalLinkLabel.font = UIFont(name: "Avenir-Roman", size: originalLinkLabelFontSize )
        
        //shorterLink
        let shorterLinkFontSize = self.shorterLink.font.pointSize;
        shorterLink.font = UIFont(name: "Avenir-Roman", size: shorterLinkFontSize )
        shorterLink.textColor = .label
        
        //deleteButton
        let image = UIImage(systemName: "trash" )
        deleteButton.setImage(image, for: .normal)
        
        // copyButton
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        copyButton.setTitle(" Copy! ", for: .normal)
        copyButton.backgroundColor = UIColor.greenBlue
        copyButton.setTitleColor(.black, for: .normal)
        copyButton.layer.cornerRadius = 5
        copyButton.layer.borderWidth = 1
        copyButton.layer.borderColor = UIColor.pinkBorderColor?.cgColor
        
        //separatorLine
        separatorLine.backgroundColor = .systemGray5
    }
    
    private func setupLayout() {
        
        //container
        container.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
