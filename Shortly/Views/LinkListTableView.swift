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
    
    var linkList: [ShorterLinkResult] = [] {
        didSet {
            tableView.reloadData()
        }
    }


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


// MARK: - TableView Data source

extension LinkListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkList.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as? LinkTableViewCell {
            let linkData = linkList[indexPath.row]
            cell.setupCell(data: linkData)
           
            cell.eventHandler =  { [weak self] events in
                switch events {
                case .removeItem(let data):
                    if let index = self?.linkList.firstIndex(where: {$0.full_short_link == data.full_short_link}) {
                        self?.linkList.remove(at: index)
                        self?.tableView.reloadData()
                    }
                   
                }
            }
            
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }
}

extension LinkListTableView: UITableViewDelegate {
    
   
}



// MARK: - Setup UI
extension LinkListTableView {
    
    func setupDefault() {
        tableView.register(LinkTableViewCell.self, forCellReuseIdentifier: "linkCell")
        tableView.dataSource = self
        tableView.delegate = self
        // add event UIButton, func press ro call mikone
    }
    
    
    
    func setupUI() {
       addSubview(tableView)
        tableView.backgroundColor = .secondarySystemBackground
        // har chizi ke mikhahim dar in laye nemayesh dade beshe bayad dar in ghesmat ezafe konim.addSubView?
        tableView.backgroundView = UIImageView(image: UIImage(named: "something.png"))
    }
    
     private func setupLayout() {
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
     }
}
