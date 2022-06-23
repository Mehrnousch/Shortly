//
//  TopDashboardView.swift
//  Shortly
//
//  Created by mehrnoush abdinian on 19.06.22.
//

import Foundation
import UIKit

class TopDashboardView: UIView {
    private lazy var tableView = UITableView()
    private lazy var data: [LinkData] = [
        LinkData(originalLink: "https://www.spiegehghughguugztftzgztfgztgztgzl.de/sie...", shorterLink: "https://rel.ink/k4|Kyk"),
        LinkData(originalLink: "https://www.frontendmen...", shorterLink: "https://rel.ink/a78sla"),
    ]


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

extension TopDashboardView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as? LinkTableViewCell {
            let linkData = data[indexPath.row]
            cell.setupCell(data: linkData)
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }
}

extension TopDashboardView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}





// MARK: - Setup UI
extension TopDashboardView {
    
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
      
    }
    
     private func setupLayout() {
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
     }
}

class LinkData {
  
    let originalLink: String
    let shorterLink: String
    //let copyButton: 
    
    
    init(originalLink: String, shorterLink: String) {
        self.originalLink = originalLink
        self.shorterLink = shorterLink
    }
    
}
