//
//  LinkListTableView.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 19.06.22.
//

import Foundation
import UIKit

class LinkListTableView: UIView {
    
    private lazy var tableView = UITableView().autoLayoutView()
    private lazy var tableBackgroundView = TableBackgroundView()
    
    var linkList: [ShorterLinkData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
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


// MARK: - TableView Data source

extension LinkListTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if linkList.isEmpty {
            tableView.backgroundView = tableBackgroundView
            tableView.separatorStyle  = .none
            return 0
        }
        else {
            tableView.backgroundView  = .none
            return linkList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as? LinkTableViewCell {
            let linkData = linkList[indexPath.row]
            cell.setupCell(data: linkData)
            cell.selectionStyle = .none
           
            cell.eventHandler =  { [weak self] events in
                
                switch events {
                    
                case .removeItem(let data):
                    if let index = self?.linkList.firstIndex(where: {$0.full_short_link == data.full_short_link}) {
                        self?.linkList.remove(at: index)
                    }
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - Setup UI
extension LinkListTableView {
    
    func setupDefault() {
        tableView.register(LinkTableViewCell.self, forCellReuseIdentifier: "linkCell")
        tableView.dataSource = self
    }
    
    func setupUI() {
        addSubview(tableView)
        addSubview(tableBackgroundView)
        tableView.backgroundColor = .systemBackground
        tableBackgroundView.backgroundColor = .systemBackground
    }
    
     private func setupLayout() {
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
     }
}
