//
//  LinkInputView.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//

import Foundation
import UIKit

class LinkInputView: UIView {
    //Send information to the parent or child page
    public enum Event {
        case shortLink(url: String)
    }
    //?
    public var eventHandler: ((Event) -> Void)?
    
    //chera lazy?
    private lazy var urlTextField = UITextField()
    private lazy var urlButton = UIButton()
   
    //tuye UIviewcontroller ma superDidview?
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupDefault()
        setupUI()
        setupLayout()
        
    }
    //?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TextField delegate

extension LinkInputView: UITextFieldDelegate {
    //If an URL is written in the textField, the button will be active and green, otherwise the button is inactive and gray.
    func textFieldDidChangeSelection(_ textField: UITextField) {
        urlButton.isEnabled = false
        print(verifyUrl(urlString: textField.text))
        if verifyUrl(urlString: textField.text){
            urlButton.isEnabled = true
        } else {
            urlButton.isEnabled = false
        }
          
       if urlButton.isEnabled{
            urlButton.backgroundColor = .green
        } else{
            urlButton.backgroundColor  = .gray
        }
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}

//MARK: -Button
extension LinkInputView {
    
    @objc func pressed() {
        // If in Textfield, there was a text or it was not empty ?
        if let url = urlTextField.text, url != "" {
            eventHandler?(.shortLink(url: url))
        }
    }
}


// MARK: - Setup UI


extension LinkInputView {
    
    func setupDefault() {
        urlTextField.delegate = self
        // add event UIButton, func press ro call mikone
        urlButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        urlButton.isEnabled = false
    }
    
    func setupUI() {
        // har chizi ke mikhahim dar in laye nemayesh dade beshe bayad dar in ghesmat ezafe konim.addSubView?
        addSubview(urlTextField)
        addSubview(urlButton)
        backgroundColor = .purple
        
        // urlTextField
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        urlTextField.backgroundColor = .secondarySystemBackground
        urlTextField.layer.cornerRadius = 5
        urlTextField.layer.borderWidth = 2
        urlTextField.placeholder =  " Please add a link here!"
        urlTextField.textAlignment = .center
        urlTextField.textColor = .label
        urlTextField.layer.borderColor = .init(red: 0.8, green: 0.2, blue: 0.3, alpha: 0.9)
        urlTextField.layer.borderWidth = 2
        
        // urlButton
        urlButton.translatesAutoresizingMaskIntoConstraints = false
        urlButton.backgroundColor = .green
        urlButton.setTitle(" Shorten It!", for: .normal)
        urlButton.layer.cornerRadius = 5
       
    }
    
    private func setupLayout() {
        urlTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        urlTextField.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        urlTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        urlTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        
//        urlButton
        //urlButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        urlButton.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 10).isActive = true
        urlButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        urlButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        urlButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        urlButton.backgroundColor = .gray
    }
}
