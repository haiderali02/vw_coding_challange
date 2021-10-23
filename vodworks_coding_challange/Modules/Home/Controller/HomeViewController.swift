//
//  HomeViewController.swift
//  vodworks_coding_challange
//
//  Created by Haider Ali on 22/10/2021.
//  Copyright © 2021 vodworks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - PROPERTIES -
    let homeView: HomeView = HomeView(frame: UIScreen.main.bounds)
    var xPosition: CGFloat = 0 {
        didSet {
            adjustRobotViewPosition()
        }
    }
    var yPosition: CGFloat = 0 {
        didSet {
            adjustRobotViewPosition()
        }
    }

    let homePresenter: HomePresenter = HomePresenter()

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
        homePresenter.setViewDelegate(delegate: self)
    }

    func adjustRobotViewPosition() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            self.homeView.robotView.transform = CGAffineTransform(translationX: self.xPosition, y: self.yPosition)
            }, completion: nil)
    }

    // MARK: - ACTIONS -

    @objc
    func didTapMoveLeft(_ sender: UIButton) {
        sender.showAnimation { [self] in
            homePresenter.moveRobotIn(direction: .left, prevXPosition: self.xPosition, prevYPosition: self.yPosition)
        }
    }
    @objc
    func didTapMoveRight(_ sender: UIButton) {
        sender.showAnimation { [self] in
            homePresenter.moveRobotIn(direction: .right, prevXPosition: self.xPosition, prevYPosition: self.yPosition)
        }
    }
    @objc
    func didTapMoveTop(_ sender: UIButton) {
        sender.showAnimation { [self] in
            homePresenter.moveRobotIn(direction: .top, prevXPosition: self.xPosition, prevYPosition: self.yPosition)
        }
    }
    @objc
    func didTapMoveBottom(_ sender: UIButton) {
        sender.showAnimation { [self] in
            homePresenter.moveRobotIn(direction: .bottom, prevXPosition: self.xPosition, prevYPosition: self.yPosition)
        }
    }
}

extension HomeViewController: HomePresenterDelegate {

    func didUpdateRobotPosition(xPosition: CGFloat, yPosition: CGFloat) {
        self.xPosition = xPosition
        self.yPosition = yPosition
    }

}
