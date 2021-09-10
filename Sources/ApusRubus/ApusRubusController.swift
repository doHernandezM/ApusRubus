//
//  File.swift
//
//
//  Created by Dennis Hernandez on 9/9/21.
//

import Foundation
import SwiftyPi

public let vaporController: VaporController = VaporController()


open class ApusRubusController {
    
    init() {
        vaporController.startVapor()
    }
}

protocol ApusRubusDelegate {
    
}
