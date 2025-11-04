//
//  SettingsViewController.swift
//  M2Homework3
//
//  Created by Oleg Konstantinov on 04.11.2025.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var nameLabel = setupLabel(text: "First name")
    private lazy var nameTextField = setupTextField(placeholder: "Enter your first name")
    private lazy var lastnameLabel = setupLabel(text: "Last name")
    private lazy var lastnameTextField = setupTextField(placeholder: "Enter your last name")
    private lazy var idNumberLabel = setupLabel(text: "National ID number")
    private lazy var idNumberTextField = setupTextField(placeholder: "Enter your last name")

    private lazy var rootStackView: UIStackView = {
        $0.axis = .vertical
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fill
        $0.alignment = .fill
        return $0
    }(UIStackView())
    
    private lazy var action: UIAction = UIAction { [weak self] _ in
        self?.navigationController?.popViewController(animated: true)
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
        title = "Настройки"
        
        view.addSubview(rootStackView)
        
        rootStackView.addArrangedSubview(nameLabel)
        rootStackView.addArrangedSubview(nameTextField)
        rootStackView.addArrangedSubview(lastnameLabel)
        rootStackView.addArrangedSubview(lastnameTextField)
        rootStackView.addArrangedSubview(idNumberLabel)
        rootStackView.addArrangedSubview(idNumberTextField)
        
        view.addSubview(saveButton)
        
        setupConstraints()
    }
}

extension SettingsViewController {
    
    private func setupLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        
        let spacer = UIView()
        spacer.heightAnchor.constraint(equalToConstant: 10).isActive = true
        rootStackView.addArrangedSubview(spacer)
        
        return label
    }
    
    private func setupTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .graySpace
        textField.font = .systemFont(ofSize: 16)
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightViewMode = .always
        return textField
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
