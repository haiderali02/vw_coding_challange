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

    // MARK: - UIViewController Life cycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        // Do any additional setup after loading the view.
    }

    // MARK: - Private Functions -

    private func setUI() {
        self.view = homeView
        self.title = R.string.localizable.homeTitle()
    }

}
