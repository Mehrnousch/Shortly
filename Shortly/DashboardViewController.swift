//
//  ViewController.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private lazy var linkInputView = LinkInputView().autoLayoutView()
    private lazy var  linkListTableView = LinkListTableView().autoLayoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandlers()
        setupDefaults()
        setupUI()
        setupLayout()
    }
}

// MARK: - Handlers

extension DashboardViewController {
    
    private func eventHandlers() {
        
        linkInputView.eventHandler = { [weak self] events in
            switch events {
            case .shortLink(let url):
                self?.dismissKeyboard()
                self?.fetchShorterLink(url: url)
            }
        }
    }
}

// MARK: - API call

extension DashboardViewController {
    
    private func fetchShorterLink(url: String) {
        Task {
            do {
                let shorterLink = try await NetworkingModel.shared.fetchAlbumWithAsyncURLSession(for: url)
                    linkListTableView.linkList.append(shorterLink)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}

// MARK: - Keyboard methods

extension DashboardViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

   @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

// MARK: - setupDefaults
extension DashboardViewController {
    
    private func setupDefaults() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // dismissKeyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
   
    private func setupUI() {
        view.addSubview(linkInputView)
        view.addSubview(linkListTableView)
        view.backgroundColor = .secondarySystemBackground
        linkListTableView.backgroundColor = .secondarySystemBackground
    }

    private func setupLayout() {
        
        //LinkTableViewCell
        linkListTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        linkListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        linkListTableView.bottomAnchor.constraint(equalTo: linkInputView.topAnchor).isActive = true
        
        //linkInputView
        linkInputView.heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        linkInputView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        linkInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
    }
}



