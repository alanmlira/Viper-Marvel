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

class CharacterPresenter: CharacterModuleInput, CharacterViewOutput {

    weak var view: CharacterViewInput?
    var interactor: CharacterInteractorInput?
    var router: CharacterRouterInput?
    
    
    // MARK:  CharacterModuleInput (PresenterProtocol) methods
    
    func viewIsReady() {
        interactor?.fetchList(0, characterName: nil)
    }
    
    
}

//MARK: CharacterInteractorOutput

extension CharacterPresenter: CharacterInteractorOutput {
    
    func didFetchCharacterList(characters: [CharacterModel]) {
        self.view?.showListView(characters)
    }
    
    func didFetchCharacterSearchList(characters: [CharacterModel]) {
        self.view?.showListView(characters)
    }
    
    func didFailFetchCharacterList(message: String) {
        print("\(__FUNCTION__): \(message)")
    }
}