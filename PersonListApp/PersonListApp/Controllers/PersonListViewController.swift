//
//  PersonListViewController.swift
//  PersonListApp
//
//  Created by Matvei Khlestov on 18.04.2024.
//

import UIKit

// MARK: - PersonListViewController
final class PersonListViewController: UIViewController {
    
    // MARK: - Private Properties
    let cellID = "personCell"
    
    // MARK: - UI Elements
    private lazy var personsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - UITableViewDataSource
extension PersonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PersonListViewController: UITableViewDelegate {
    
}

// MARK: - Private methods
private extension PersonListViewController {
    func setupView() {
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
}

// MARK: - Constraints
private extension PersonListViewController {
    func setConstraints() {
        
    }
}

