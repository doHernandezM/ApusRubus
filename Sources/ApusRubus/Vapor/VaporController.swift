//
//  File.swift
//
//
//  Created by Dennis Hernandez on 9/6/21.
// Moved Vapor to it's own controller for tidiness

import Leaf
import Vapor

public class VaporController {
    
    var env: Environment?
    var app: Application?
    
    public init() {
    }
    
    public func start() throws {
        do {
            
            env = try Environment.detect()
            try LoggingSystem.bootstrap(from: &env!)
            app = Application(env!)
            defer { app!.shutdown() }
            app!.http.server.configuration.port = 8080
            app!.http.server.configuration.hostname = "0.0.0.0"
            // register routes
            try routes(app!)
//            print(app!.routes.all)
            
            try app!.run()
        } catch {
            env = nil
            app = nil
            print("Vapor Init Error")
            return
        }
    }
    
//   public func routes() throws {
//        app!.get { req in
//            return req.redirect(to: "https://www.youtube.com/watch?v=RfiQYRn7fBg")
//        }
//        
//        let routeController = RouteController()
//        try app!.register(collection: routeController)
//        
//        let misterRoutes = app!.grouped("Rubus","*")
//        misterRoutes.get(use: setRubusHandler)
//        misterRoutes.get(":device",":mode", use: setRubusHandler)
//        
//        
//    }
    
    
    
    public func stopVapor() {
        app!.shutdown()
        app = nil
        env = nil
    }
}
