//
//
//
//
//  Created by Dennis Hernandez on 8/22/21.
//

import Vapor
import SwiftyPi

struct RouteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let misterRoutes = routes.grouped("mister")
        misterRoutes.get(use: setMisterHandler)
        misterRoutes.get(":device",":mode", use: setMisterHandler)

    }
    
    
    //MARK:Mister
    func setMisterHandler(_ req: Request) -> String {
        let mode = req.parameters.get("mode")
        let dev = req.parameters.get("device")
       print(dev,mode)
        if mode != nil {
//            let state = SwiftyPiMode(rawValue: mode!) ?? Tanker.main?.misterState
//            Tanker.main?.misterState = state ?? .off
        }
        
//        switch Tanker.main?.misterState {
//        case .off:
//            return "0"
//        default:
//            return "1"
//        }
        return "nope"
    }
    
}
