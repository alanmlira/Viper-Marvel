//
//  CharacterPresenter.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/7/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  VIPER Template: https://github.com/gui-assis/ViperTemplate
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

class CharacterPresenter: CharacterModuleInput, CharacterViewOutput, CharacterInteractorOutput {

    var view: CharacterViewInput?
    var interactor: CharacterInteractorInput?
    var router: CharacterRouterInput?

    func viewIsReady() {
        
    }
}
