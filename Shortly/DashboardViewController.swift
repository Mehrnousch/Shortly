//
//  ViewController.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 16.06.22.
//

import UIKit

class DashboardViewController: UIViewController {

    //linkInputView is appearance of url login page
    var linkInputView = LinkInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    
    private func setupUI() {
        view.addSubview(linkInputView)
        //vaghti az Storyboard estefede nemikonim code zir ra minevisim, chera?
        
        linkInputView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
  
    private func setupLayout() {
        //linkInputView
        linkInputView.heightAnchor.constraint(equalToConstant: 180 ).isActive = true
        linkInputView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        //linkInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        linkInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        
        
        
       
        
        
        
    }
    
    
    
    
}




