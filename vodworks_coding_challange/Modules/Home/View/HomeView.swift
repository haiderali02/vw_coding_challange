//
//  HomeView.swift
//  vodworks_coding_challange
//
//  Created by Haider Ali on 22/10/2021.
//  Copyright © 2021 vodworks. All rights reserved.
//

import SnapKit
import UIKit

class HomeView: UIView {

    var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemRed.cgColor
        view.layer.cornerRadius = 8
        return view
    }()

    var childContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemRed.cgColor
        view.layer.cornerRadius = 8
        return view
    }()

    var robotView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemRed.cgColor
        view.layer.cornerRadius = 8
        return view
    }()

    var robotImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = R.image.img_robot()
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 8
        return imgView
    }()

    var buttonContainerView: UIStackView = {
        let stView = UIStackView()
        stView.axis = .horizontal
        stView.spacing = 8
        stView.clipsToBounds = true
        stView.layer.cornerRadius = 8
        stView.distribution = .fillEqually
        return stView
    }()

    var moveLeftButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor.systemRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle(R.string.localizable.homeLeft(), for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    var moveRightButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor.systemRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle(R.string.localizable.homeRight(), for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    var moveTopButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle(R.string.localizable.homeTop(), for: .normal)
        button.backgroundColor = UIColor.systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    var moveBottomButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor.systemRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle(R.string.localizable.homeBottom(), for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews() {
        addSubview(containerView)
        addSubview(buttonContainerView)
        containerView.addSubview(childContainerView)
        childContainerView.addSubview(robotView)
        buttonContainerView.addArrangedSubview(moveLeftButton)
        buttonContainerView.addArrangedSubview(moveRightButton)
        buttonContainerView.addArrangedSubview(moveTopButton)
        buttonContainerView.addArrangedSubview(moveBottomButton)
        robotView.addSubview(robotImageView)
    }

    func configureViews() {
        self.backgroundColor = .white
        containerView.backgroundColor = UIColor.systemRed
        childContainerView.backgroundColor = .systemGreen
        buttonContainerView.backgroundColor = UIColor.white
        robotView.backgroundColor = .white
    }

    func setUpConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(buttonContainerView.snp.top).inset(-8)
        }
        buttonContainerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(60)
        }
        childContainerView.snp.makeConstraints { make in
            make.edges.equalTo(containerView).inset(16)
        }
        robotView.snp.makeConstraints { make in
            make.height.width.equalTo(75)
            make.centerX.equalTo(childContainerView.snp.centerX)
            make.centerY.equalTo(childContainerView.snp.centerY)
        }
        robotImageView.snp.makeConstraints { make in
            make.edges.equalTo(robotView)
        }
    }
}
