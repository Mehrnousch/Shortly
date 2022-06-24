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
    var topDashboardView = TopDashboardView().autoLayoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaults()
        setupUI()
        setupLayout()
    }
}


// MARK: - API call

extension DashboardViewController {

}
    
 
extension DashboardViewController {
    
    private func setupDefaults() {
        
        Task {
            do {
                let shorterLink = try await ShortlyDataModel.shared.fetchAlbumWithAsyncURLSession(for: "https://stackoverflow.com/questions/26364914/http-request-in-swift-with-post-method")
                print(shorterLink)
            } catch {
                print("Request failed with error: \(error)")
            }

        }
    }
    
    private func setupUI() {
        view.addSubview(linkInputView)
        //vaghti az Storyboard estefede nemikonim code zir ra minevisim, chera?
        view.addSubview(topDashboardView)
        view.backgroundColor = .secondarySystemBackground
        topDashboardView.backgroundColor = .secondarySystemBackground
    }
    
    
    
  
    private func setupLayout() {
        
        //topDashboardView
        topDashboardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        //topDashboardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topDashboardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topDashboardView.bottomAnchor.constraint(equalTo: linkInputView.topAnchor).isActive = true
        
        //linkInputView
        linkInputView.heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        linkInputView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        //linkInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //linkInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        
    }
    
}



