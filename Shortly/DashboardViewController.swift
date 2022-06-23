//
//  ViewController.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//

import UIKit

class DashboardViewController: UIViewController {

    //linkInputView is appearance of url login
    var linkInputView = LinkInputView()
    var topDashboardView = TopDashboardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    
    private func setupUI() {
        view.addSubview(linkInputView)
        //vaghti az Storyboard estefede nemikonim code zir ra minevisim, chera?
        linkInputView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topDashboardView)
        topDashboardView.translatesAutoresizingMaskIntoConstraints = false
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




