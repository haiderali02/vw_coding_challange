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
            //adjustRobotViewPosition()
        }
    }
    var yPosition: CGFloat = 0 {
        didSet {
            //adjustRobotViewPosition()
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
        self.homeView.showLocationButton.addTarget(self, action: #selector(didTapShowLocation(_:)), for: .touchUpInside)
        homePresenter.setViewDelegate(delegate: self)
    }

    func adjustRobotViewPosition(newXPosition: CGFloat, newYPosition: CGFloat) {
        self.xPosition = newXPosition
        self.yPosition = newYPosition
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
    func didTapShowLocation(_ sender: UIButton) {
        sender.showAnimation { [self] in
            let robotViewBounds = self.homeView.robotView.bounds
            let robotViewFrames = self.homeView.robotView.frame
            let alertController = UIAlertController(title: "Robot View", message: "Bounds: \(robotViewBounds)\nFrames: \(robotViewFrames)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
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
    func didUpdateRobotPosition(xPosition: CGFloat, yPosition: CGFloat, direction: Directions) {

        let tableViewFrame = self.homeView.childContainerView.frame
        let robotViewFrame = self.homeView.robotView.frame

        if tableViewFrame.contains(robotViewFrame) {
            self.adjustRobotViewPosition(newXPosition: xPosition, newYPosition: yPosition)
        } else {
            switch direction {
            case .left:
                let updatedPosition = self.xPosition + Constants.steps
                self.adjustRobotViewPosition(newXPosition: updatedPosition, newYPosition: yPosition)
            case .right:
                let updatedPosition = self.xPosition - Constants.steps
                self.adjustRobotViewPosition(newXPosition: updatedPosition, newYPosition: yPosition)
            case .top:
                let updatedPosition = self.yPosition + Constants.steps
                self.adjustRobotViewPosition(newXPosition: xPosition, newYPosition: updatedPosition)
            case .bottom:
                let updatedPosition = self.yPosition - Constants.steps
                self.adjustRobotViewPosition(newXPosition: xPosition, newYPosition: updatedPosition)
            }
        }
    }
}
