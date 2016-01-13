//
//  Pokemon.swift
//  pokedex
//
//  Created by Ching Kim Fu Cliff on 1/13/16.
//  Copyright © 2016 Ching Kim Fu Cliff. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init (name:String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}