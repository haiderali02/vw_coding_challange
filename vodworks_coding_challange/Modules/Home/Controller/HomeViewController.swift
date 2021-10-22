//
//  HomeViewController.swift
//  vodworks_coding_challange
//
//  Created by Haider Ali on 22/10/2021.
//  Copyright © 2021 vodworks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView: HomeView = HomeView(frame: UIScreen.main.bounds)

    // MARK: - UIViewController LIFECYCLE -

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        // Do any additional setup after loading the view.
    }

    // MARK: - PRIVATE FUNCTIONS -

    private func setUI() {
        self.view = homeView
        self.title = R.string.localizable.homeTitle()
        self.homeView.moveLeftButton.addTarget(self, action: #selector(didTapMoveLeft(_:)), for: .touchUpInside)
        self.homeView.moveRightButton.addTarget(self, action: #selector(didTapMoveRight(_:)), for: .touchUpInside)
        self.homeView.moveTopButton.addTarget(self, action: #selector(didTapMoveTop(_:)), for: .touchUpInside)
        self.homeView.moveBottomButton.addTarget(self, action: #selector(didTapMoveBottom(_:)), for: .touchUpInside)
    }

    // MARK: - ACTIONS -

    @objc
    func didTapMoveLeft(_ sender: UIButton) {
        sender.showAnimation {}
    }
    @objc
    func didTapMoveRight(_ sender: UIButton) {
        sender.showAnimation {}
    }
    @objc
    func didTapMoveTop(_ sender: UIButton) {
        sender.showAnimation {}
    }
    @objc
    func didTapMoveBottom(_ sender: UIButton) {
        sender.showAnimation {}
    }
}
