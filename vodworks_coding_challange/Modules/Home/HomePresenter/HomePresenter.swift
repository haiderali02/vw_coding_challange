//
//  HomePresenter.swift
//  vodworks_coding_challange
//
//  Created by Haider Ali on 24/10/2021.
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

public class HomePresenter {

    weak var delegate: HomePresenterAliays?

    var horizontolDirection: CGFloat = 0.0
    var verticleDirection: CGFloat = 0.0

    func moveRobotIn(direction: Directions, prevXPosition: CGFloat, prevYPosition: CGFloat) {
        var newX: CGFloat = prevXPosition
        var newY: CGFloat = prevYPosition
        switch direction {
        case .left:
            newX -= Constants.steps
            self.horizontolDirection = newX
        case .right:
            newX += Constants.steps
            self.horizontolDirection = newX
        case .top:
            newY -= Constants.steps
            self.verticleDirection = newY
        case .bottom:
            newY += Constants.steps
            self.verticleDirection = newY
        }
        self.delegate?.didUpdateRobotPosition(xPosition: newX, yPosition: newY, direction: direction)
    }

    func setViewDelegate(delegate: HomePresenterAliays) {
        self.delegate = delegate
    }
}

struct Constants {
    static let steps: CGFloat = 30
}
