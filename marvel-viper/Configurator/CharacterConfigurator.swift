//
//  CharacterConfigurator.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/7/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  VIPER Template: https://github.com/gui-assis/ViperTemplate
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

import UIKit

class CharacterModuleConfigurator {

    static func configure(viewController: CharacterViewController) {

        let router = CharacterRouter()

        let presenter = CharacterPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharacterInteractor(service: CharactersService())
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
