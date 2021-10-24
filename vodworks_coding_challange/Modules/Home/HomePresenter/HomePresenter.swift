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
    func didUpdateRobotPosition(xPosition: CGFloat, yPosition: CGFloat, direction: Directions)
}

typealias HomePresenterAliays = HomePresenterDelegate & UIViewController

class HomePresenter {

    weak var delegate: HomePresenterAliays?

    public func moveRobotIn(direction: Directions, prevXPosition: CGFloat, prevYPosition: CGFloat) {
        var newX: CGFloat = prevXPosition
        var newY: CGFloat = prevYPosition
        switch direction {
        case .left:
            newX -= Constants.steps
        case .right:
            newX += Constants.steps
        case .top:
            newY -= Constants.steps
        case .bottom:
            newY += Constants.steps
        }
        self.delegate?.didUpdateRobotPosition(xPosition: newX, yPosition: newY, direction: direction)
    }

    public func setViewDelegate(delegate: HomePresenterAliays) {
        self.delegate = delegate
    }
}

struct Constants {
    static let steps: CGFloat = 30
}
