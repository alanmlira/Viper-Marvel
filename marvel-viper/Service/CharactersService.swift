//
//  CharactersService.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/8/16.
//  Copyright © 2016 Alan Lira. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol CharacterServiceDelegate {
    func onGetCharacters(characters: [CharacterModel])
    func onGetCharactersError(error: NSError)
}

class CharactersService: NSObject {
    
    private let path = "public/characters"
    private let service = BaseService()
    
    var delegate: CharacterServiceDelegate?
    
    func getCharacters(offset: Int, characterName: String? = nil){
        
        var parameters: [String: AnyObject]?
        
        if let _name = characterName {
            parameters = ["nameStartsWith": _name]
        }
        
        service.get(self.path, offset: offset, parameters: parameters) { (json, error) -> Void  in
            
            guard error == nil else {
                self.delegate?.onGetCharactersError(error!)
                return
            }
            
            if let _json = json {
                var characters: [CharacterModel] = []
                for (_, subJson):(String, JSON) in _json {
                    characters.append(CharacterModel(json: subJson)!)
                }
                
                self.delegate?.onGetCharacters(characters)
            }
        }
    }
}
