//
//  ViewController.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    //linkInputView is appearance of url login
    var linkInputView = LinkInputView().autoLayoutView()
    var linkListTableView = LinkListTableView().autoLayoutView()
    
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
                self?.getShorterLink(url: url)
            }
        }
    }

}

// MARK: - API call

extension DashboardViewController {

    private func getShorterLink(url: String) {
        
        Task {
            do {
                let shorterLink = try await ShortlyDataModel.shared.fetchAlbumWithAsyncURLSession(for: url)
                
                linkListTableView.linkList.append(shorterLink)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
}
    
 
extension DashboardViewController {
    
    private func setupDefaults() {
        
    }
    
    private func setupUI() {
        view.addSubview(linkInputView)
        //vaghti az Storyboard estefede nemikonim code zir ra minevisim, chera?
        view.addSubview(linkListTableView)
        view.backgroundColor = .secondarySystemBackground
        linkListTableView.backgroundColor = .secondarySystemBackground
    }
    
    
    
  
    private func setupLayout() {
        
        //LinkTableViewCell
        linkListTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        //topDashboardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        linkListTableView.bottomAnchor.constraint(equalTo: linkInputView.topAnchor).isActive = true
        
        //linkInputView
        linkInputView.heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        linkInputView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        //linkInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //linkInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        
    }
    
}



