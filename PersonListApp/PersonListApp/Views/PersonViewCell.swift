//
//  PersonViewCell.swift
//  PersonListApp
//
//  Created by Matvei Khlestov on 18.04.2024.
//

import UIKit

// MARK: - PersonViewCell
final class PersonViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    private lazy var mainPersonView: UIView = {
        let personView = UIView()
        personView.translatesAutoresizingMaskIntoConstraints = false
        personView.backgroundColor = .appGray
        personView.layer.cornerRadius = 30
        
        return personView
    }()
    
    private lazy var largeImageView: UIImageView = {
        createImageView(radius: 30)
    }()
    
    private lazy var smallImageView: UIImageView = {
        createImageView(radius: 31.5)
    }()
    
    private lazy var fullNameLabel: UILabel = {
        createLabel(textColor: .white, font: .systemFont(ofSize: 20, weight: .bold))
    }()
    
    private lazy var headerLabel: UILabel = {
        createLabel(text: "Заголовок", font: .systemFont(ofSize: 20, weight: .bold))
    }()
    
    private lazy var descriptionLabel: UILabel = {
        createLabel(font: .systemFont(ofSize: 16, weight: .regular), lines: 0)
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = .appGreen
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Override Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(person: Person) {
        largeImageView.image = UIImage(named: person.largePhoto)
        smallImageView.image = UIImage(named: person.smallPhoto)
        fullNameLabel.text = person.fullName
        descriptionLabel.text = person.description
    }
}

// MARK: - Private methods
private extension PersonViewCell {
    func setupView() {
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        addSubview(mainPersonView)
        
        for subview in [largeImageView, headerLabel, descriptionLabel, nextButton] {
            mainPersonView.addSubview(subview)
        }
        
        for subview in [smallImageView, fullNameLabel] {
            largeImageView.addSubview(subview)
        }
    }
    
    func createImageView(radius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = radius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    func createLabel(text: String? = nil,
                     textColor: UIColor? = nil,
                     font: UIFont, lines: Int? = nil) -> UILabel {
        
        let label = UILabel()
        label.font = font
        label.text = text
        label.textColor = textColor
        label.numberOfLines = lines ?? 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}

// MARK: - Constraints
private extension PersonViewCell {
    func setConstraints() {
        setConstraintsForMainPersonView()
        setConstraintsForLargeImageView()
        setConstraintsForSmallImageView()
        setConstraintsForFullNameLabel()
        setConstraintsForHeaderLabel()
        setConstraintsForDescriptionLabel()
        setConstraintsForNextButton()
    }
    
    func setConstraintsForMainPersonView() {
        NSLayoutConstraint.activate([
            mainPersonView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 11
            ),
            mainPersonView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 30
            ),
            mainPersonView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -30
            ),
            mainPersonView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -11
            )
            
        ])
    }
    
    func setConstraintsForLargeImageView() {
        NSLayoutConstraint.activate([
            largeImageView.topAnchor.constraint(
                equalTo: mainPersonView.topAnchor,
                constant: 20
            ),
            largeImageView.leadingAnchor.constraint(
                equalTo: mainPersonView.leadingAnchor,
                constant: 20
            ),
            largeImageView.trailingAnchor.constraint(
                equalTo: mainPersonView.trailingAnchor,
                constant: -20
            ),
            largeImageView.heightAnchor.constraint(
                equalToConstant: 239
            )
        ])
    }
    
    func setConstraintsForSmallImageView() {
        NSLayoutConstraint.activate([
            smallImageView.topAnchor.constraint(
                equalTo: largeImageView.topAnchor,
                constant: 20
            ),
            smallImageView.leadingAnchor.constraint(
                equalTo: largeImageView.leadingAnchor,
                constant: 20
            ),
            smallImageView.widthAnchor.constraint(
                equalToConstant: 63
            ),
            smallImageView.heightAnchor.constraint(
                equalToConstant: 63
            )
        ])
    }
    
    func setConstraintsForFullNameLabel() {
        NSLayoutConstraint.activate([
            fullNameLabel.bottomAnchor.constraint(
                equalTo: largeImageView.bottomAnchor,
                constant: -40
            ),
            fullNameLabel.leadingAnchor.constraint(
                equalTo: largeImageView.leadingAnchor,
                constant: 20
            )
        ])
    }
    
    func setConstraintsForHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(
                equalTo: largeImageView.bottomAnchor,
                constant: 21
            ),
            headerLabel.leadingAnchor.constraint(
                equalTo: mainPersonView.leadingAnchor,
                constant: 36
            )
        ])
    }
    
    func setConstraintsForDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: headerLabel.bottomAnchor,
                constant: 12
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: mainPersonView.leadingAnchor,
                constant: 20
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: mainPersonView.trailingAnchor,
                constant: -20
            )
        ])
    }
    
    func setConstraintsForNextButton() {
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: 26
            ),
            nextButton.bottomAnchor.constraint(
                equalTo: mainPersonView.bottomAnchor,
                constant: -40
            ),
            nextButton.leadingAnchor.constraint(
                equalTo: mainPersonView.leadingAnchor,
                constant: 20
            ),
            nextButton.trailingAnchor.constraint(
                equalTo: mainPersonView.trailingAnchor,
                constant: -20
            ),
            nextButton.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
    }
}
