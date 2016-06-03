//
//  CharacterListConfigurator.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/3/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

import UIKit

class CharacterListModuleConfigurator {

    static func configure(viewController: CharacterListViewController) {

        let router = CharacterListRouter()

        let presenter = CharacterListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharacterListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
