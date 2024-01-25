//
//  Constants.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation

public enum Constants {
    public enum Key {        
        public static var offset = "offset"
        public static var limit = "limit"
        static var contentType = "Content-Type"
        static var accept = "Accept"
    }
    
    public enum Api {
        public static var baseUrl = URL(string: "https://pokeapi.co")
        public static var baseImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    }

    enum Value {
        static var json = "application/json; charset=utf-8"
    }
}
