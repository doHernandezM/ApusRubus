//
//  File.swift
//
//
//  Created by Dennis Hernandez on 9/6/21.
// Moved Vapor to it's own controller for tidiness

import Vapor

public class VaporController {
    
    var env: Environment?
    var app: Application?
    
    public init() {
    }
    
    public func startVapor() {
        do {
            env = try Environment.detect()
            try LoggingSystem.bootstrap(from: &env!)
            app = Application(env!)
            defer { app!.shutdown() }
            try configure(app!)
            try app!.run()
        } catch {
            env = nil
            app = nil
            print("Vapor Init Error")
            return
        }
    }
    
   public func routes() throws {
        app!.get { req in
            return req.redirect(to: "https://www.youtube.com/watch?v=RfiQYRn7fBg")
        }
        
        let routeController = RouteController()
        try app!.register(collection: routeController)
        
        let misterRoutes = app!.grouped("Rubus","*")
        misterRoutes.get(use: setRubusHandler)
        misterRoutes.get(":device",":mode", use: setRubusHandler)
        
        
    }
    
    func setRubusHandler(_ req: Request) -> String {
        let mode = req.parameters.get("mode")
        let dev = req.parameters.get("device")
        print(dev!,mode!)
        return "Dev:\(dev) Mode:\(mode)"
    }
    
    public func stopVapor() {
        app!.shutdown()
        app = nil
        env = nil
    }
}
