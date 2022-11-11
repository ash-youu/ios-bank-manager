//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    var bank: Bank = Bank()
    
    let mainStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
    
    let buttonStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let addClientButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(addClients),
                         for: .touchUpInside)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let waitingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        return label
    }()
    
    let workingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        return label
    }()
    
    let waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let workingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let workingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let statusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    func setup() {
        view.backgroundColor = .white
        addViews()
        setAutoLayout()
    }
    
    func addViews() {
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        labelStackView.addArrangedSubview(waitingTitleLabel)
        labelStackView.addArrangedSubview(workingTitleLabel)
        
        waitingScrollView.addSubview(waitingStackView)
        workingScrollView.addSubview(workingStackView)
        
        statusStackView.addArrangedSubview(waitingScrollView)
        statusStackView.addArrangedSubview(workingScrollView)
        
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(timerLabel)
        mainStackView.addArrangedSubview(labelStackView)
        mainStackView.addArrangedSubview(statusStackView)
        
        self.view.addSubview(mainStackView)
    }
    
    func setAutoLayout() {
        mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.topAnchor).isActive = true
        waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.widthAnchor).isActive = true
        
        workingStackView.topAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.topAnchor).isActive = true
        workingStackView.leadingAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        workingStackView.trailingAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        workingStackView.bottomAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        workingStackView.widthAnchor.constraint(equalTo: workingScrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
    
    @objc func tapAddClientButton() {
        bank.updateClients()
        
        let label: UILabel = UILabel()
        label.text = "\(number) - 예금"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        waitingStackView.addArrangedSubview(label)
    }
    
    @objc func tapResetButton() {
        bank.resetWorkData()
    }
    
    @objc func addClients() {
        for number in 0..<10 {
            
        }
        
        for number in 0..<10 {
            let label: UILabel = UILabel()
            label.text = "\(number) - 예금"
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            workingStackView.addArrangedSubview(label)
        }
    }
}

