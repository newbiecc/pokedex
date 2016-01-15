//
//  Pokemon.swift
//  pokedex
//
//  Created by Ching Kim Fu Cliff on 1/13/16.
//  Copyright © 2016 Ching Kim Fu Cliff. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type:String!
    private var _defense: String!
    private var _height:String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init (name:String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    // Use alaomofire to download from the internet 
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        // Make sure download has been finished before opening a view controller 
        // This will be run before the view popped up
        
        let url = NSURL(string: _pokemonUrl)!              // Since NSURL is not https, go to Info.plist and set NSAppTransportSecurity Allow Arbitrary loads
        Alamofire.request(.GET, url).responseJSON {         // Network request
            response in let result = response.result
            // for testing: print(result.value.debugDescription)
            
            //Parse to a dictionary 
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                //types is array of dictionary 
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    // print(types.debugDescription)
                    if let name = types[0]["name"]  {
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"]{
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                print(self._type)
            }
        }
        

    }
}