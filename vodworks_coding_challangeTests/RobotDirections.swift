//
//  RobotDirections.swift
//  vodworks_coding_challangeTests
//
//  Created by Haider Ali on 24/10/2021.
//  Copyright © 2021 vodworks. All rights reserved.
//

@testable import vodworks_coding_challange
import XCTest

class RobotDirections: XCTestCase {

    func testMoveInLeftDirection() {
        let homePresenter = HomePresenter()
        homePresenter.moveRobotIn(direction: .left, prevXPosition: 50, prevYPosition: 10)
        let results = homePresenter.horizontolDirection
        XCTAssertEqual(results, 20)
    }

    func testMoveInRightDirection() {
        let homePresenter = HomePresenter()
        homePresenter.moveRobotIn(direction: .right, prevXPosition: 50, prevYPosition: 10)
        let results = homePresenter.horizontolDirection
        XCTAssertEqual(results, 80)
    }

    func testMoveInTopDirection() {
        let homePresenter = HomePresenter()
        homePresenter.moveRobotIn(direction: .top, prevXPosition: 50, prevYPosition: 50)
        let results = homePresenter.verticleDirection
        XCTAssertEqual(results, 20)
    }

    func testMoveInDownDirection() {
        let homePresenter = HomePresenter()
        homePresenter.moveRobotIn(direction: .bottom, prevXPosition: 50, prevYPosition: 50)
        let results = homePresenter.verticleDirection
        XCTAssertEqual(results, 80)
    }
}
