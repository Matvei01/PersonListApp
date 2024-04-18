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
    
    let persons = Person.getPersons()
    
    // MARK: - UI Elements
    private lazy var personsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PersonViewCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PersonViewCell else {
            return UITableViewCell()
        }
        
        let person = persons[indexPath.row]
        
        cell.configure(person: person)
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - Private methods
private extension PersonListViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(personsTableView)
        
        setConstraints()
    }
}

// MARK: - Constraints
private extension PersonListViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            personsTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            personsTableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            personsTableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            personsTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }
}

