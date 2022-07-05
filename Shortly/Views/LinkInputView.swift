//
//  LinkInputView.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//
import Foundation
import UIKit

class LinkInputView: UIView {
    
    public enum Event {
        case shortLink(url: String)
    }
   
    public var eventHandler: ((Event) -> Void)?

    private lazy var urlTextField = UITextField()
    private lazy var urlButton = UIButton()
   
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupDefault()
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TextField delegate

extension LinkInputView: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonStatus(textField: textField)
    }
    
    private func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    private func updateButtonStatus(textField: UITextField) {
        
        if verifyUrl(urlString: textField.text) {
            
            urlButton.isEnabled = true
        } else {
            urlButton.isEnabled = false
        }
          
       if urlButton.isEnabled {
           
           urlButton.backgroundColor = UIColor.greenBlue
        } else{
            urlButton.backgroundColor  = .gray
        }
    }
    
}

//MARK: -Button
extension LinkInputView {
    
    @objc func pressed() {
        if let url = urlTextField.text, url != "" {
            eventHandler?(.shortLink(url: url))
            
        }
    }
}


// MARK: - Setup UI

extension LinkInputView {
    
    func setupDefault() {
        urlTextField.delegate = self
        urlButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        urlButton.isEnabled = false
    }
    
    func setupUI() {
        addSubview(urlTextField)
        addSubview(urlButton)
        backgroundColor = UIColor.purple
        
        // urlTextField
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        urlTextField.backgroundColor = .secondarySystemBackground
        urlTextField.layer.cornerRadius = 5
        urlTextField.layer.borderWidth = 2
        urlTextField.placeholder =  " Please add a link here!"
        urlTextField.textAlignment = .center
        urlTextField.textColor = .label
        urlTextField.layer.borderColor = UIColor.pinkBorderColor?.cgColor
        urlTextField.layer.borderWidth = 2
        urlTextField.autocapitalizationType = .none
        
        // urlButton
        urlButton.translatesAutoresizingMaskIntoConstraints = false
        urlButton.setTitle(" Shorten It!", for: .normal)
        urlButton.layer.cornerRadius = 5
    }
    
    private func setupLayout() {
        urlTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        urlTextField.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        urlTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        urlTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        
        //urlButton
        urlButton.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 10).isActive = true
        urlButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        urlButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        urlButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        urlButton.backgroundColor = .gray
    }
}
