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
    
    private lazy var action: UIAction = UIAction { [weak self] _ in
        let settingsViewController = SettingsViewController()
        self?.navigationController?.pushViewController(settingsViewController, animated: true)
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
        // Do any additional setup after loading the view.
    }


}

