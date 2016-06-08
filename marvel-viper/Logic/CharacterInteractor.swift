//
//  CharacterInteractor.swift
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

class CharacterInteractor: CharacterInteractorInput {

    var output: CharacterInteractorOutput?
    
    private let service: CharactersService
    
    init(service: CharactersService) {
        self.service = service
        self.service.delegate = self
    }
    
    //MARK: CharacterInteractorInput
    func fetchList(offset: Int = 0, characterName: String? = nil) {
        service.getCharacters(offset, characterName: characterName)
    }
    
}

extension CharacterInteractor: CharacterServiceDelegate {
    func onGetCharacters(characters: [CharacterModel]) {
        self.output?.didFetchCharacterList(characters)
    }
    
    func onGetCharactersError(error: NSError) {
        self.output?.didFailFetchCharacterList(error.localizedDescription)
    }
}
