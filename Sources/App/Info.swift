//
//  Info.swift
//  
//
//  Created by Karun Pant on 28/12/22.
//

import Vapor

struct Info: Content {
    let name: String
}

struct InfoResponse: Content {
    let response: Info
}
