//
//  ViewController.swift
//  M2Homework3
//
//  Created by Oleg Konstantinov on 04.11.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var rootStackView = createStackView(axis: .horizontal, spacing: 14, alignment: .center)
    private lazy var subStackView = createStackView(axis: .vertical, spacing: 0, alignment: .leading)
    
    private lazy var contentName = setupLabel(text: "About", font: .boldSystemFont(ofSize: 14))
    private lazy var content = setupLabel(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam")
    
    private lazy var avatarImageView: UIImageView = {
        $0.image = UIImage(named: "avatar")
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return $0
    }(UIImageView())
    
    private lazy var action: UIAction = UIAction { _ in
        let settingsViewController = SettingsViewController()
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    private lazy var saveButton: UIButton = {
        $0.setTitle("Сохранить", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .seaGreen
        $0.frame.size.height = 48
        $0.layer.cornerRadius = $0.frame.size.height / 4
        $0.setTitleColor(.white, for: .normal)
        return $0
    }(UIButton(primaryAction: action))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Главная"
        
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(avatarImageView)
        rootStackView.addArrangedSubview(subStackView)
        
        subStackView.addArrangedSubview(setupLabel(text: "User Name", font: .boldSystemFont(ofSize: 20)))
        subStackView.addArrangedSubview(setupLabel(text: "26 years"))

        view.addSubview(contentName)
        view.addSubview(content)
        view.addSubview(saveButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(actionForButton))
        setupConstraints()
    }
    
}

extension MainViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contentName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            contentName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentName.topAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 35),
            
            content.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            content.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            content.topAnchor.constraint(equalTo: contentName.bottomAnchor, constant: 11),
            
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.topAnchor.constraint(equalTo: content.bottomAnchor, constant: 85),
                                    ])
    }
    
    private func createStackView(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fillProportionally,
        spacing: CGFloat,
        alignment: UIStackView.Alignment
    ) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.alignment = alignment
        
        return stackView
    }
    
    private func setupLabel(
        text: String,
        font: UIFont = .systemFont(ofSize: 14)
    ) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.numberOfLines = 0
        
        return label
    }
    
    @objc func actionForButton () {
        let settingViewController = SettingsViewController()
        navigationController?.pushViewController(settingViewController, animated: true)
    }

}
