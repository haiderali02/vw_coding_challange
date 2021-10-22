//
//  HomeViewController.swift
//  vodworks_coding_challange
//
//  Created by Haider Ali on 22/10/2021.
//  Copyright © 2021 vodworks. All rights reserved.
//

import UIKit

enum Directions {
    case top
    case bottom
    case left
    case right
}

class HomeViewController: UIViewController {

    // MARK: - PROPERTIES -
    let homeView: HomeView = HomeView(frame: UIScreen.main.bounds)
    var xPosition: CGFloat = 0 {
        didSet {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
                self.homeView.robotView.transform = CGAffineTransform(translationX: self.xPosition, y: self.yPosition)
                }, completion: nil)
        }
    }
    var yPosition: CGFloat = 0 {
        didSet {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
                self.homeView.robotView.transform = CGAffineTransform(translationX: self.xPosition, y: self.yPosition)
                }, completion: nil)
        }
    }
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

    private func moveBoxInThe(direction: Directions) {
        switch direction {
        case .left:
            print("Move Left")
            self.xPosition -= 20
        case .right:
            print("Move Right")
            self.xPosition += 20
        case .top:
            print("Move Top")
            self.yPosition -= 20
        case .bottom:
            self.yPosition += 20
            print("Move Bottom")
        }
    }

    // MARK: - ACTIONS -

    @objc
    func didTapMoveLeft(_ sender: UIButton) {
        sender.showAnimation {
            self.moveBoxInThe(direction: .left)
        }
    }
    @objc
    func didTapMoveRight(_ sender: UIButton) {
        sender.showAnimation {
            self.moveBoxInThe(direction: .right)
        }
    }
    @objc
    func didTapMoveTop(_ sender: UIButton) {
        sender.showAnimation {
            self.moveBoxInThe(direction: .top)
        }
    }
    @objc
    func didTapMoveBottom(_ sender: UIButton) {
        sender.showAnimation {
            self.moveBoxInThe(direction: .bottom)
        }
    }
}
