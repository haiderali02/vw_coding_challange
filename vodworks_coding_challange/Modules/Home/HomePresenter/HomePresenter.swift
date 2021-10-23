//
//  HomePresenter.swift
//  vodworks_coding_challange
//
//  Created by Haider Ali on 23/10/2021.
//  Copyright © 2021 vodworks. All rights reserved.
//

import Foundation
import UIKit

enum Directions {
    case top
    case bottom
    case left
    case right
}

protocol HomePresenterDelegate: AnyObject {
    func didUpdateRobotPosition(xPosition: CGFloat, yPosition: CGFloat)
}

typealias HomePresenterAliays = HomePresenterDelegate & UIViewController

class HomePresenter {

    weak var delegate: HomePresenterAliays?

    public func moveRobotIn(direction: Directions, prevXPosition: CGFloat, prevYPosition: CGFloat) {
        var newX: CGFloat = prevXPosition
        var newY: CGFloat = prevYPosition
        switch direction {
        case .left:
            newX -= 30
        case .right:
            newX += 30
        case .top:
            newY -= 30
        case .bottom:
            newY += 20
        }
        self.delegate?.didUpdateRobotPosition(xPosition: newX, yPosition: newY)
    }

    public func setViewDelegate(delegate: HomePresenterAliays) {
        self.delegate = delegate
    }
}
