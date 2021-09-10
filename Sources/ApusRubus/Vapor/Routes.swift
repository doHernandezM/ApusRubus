import Vapor

// Right now we do not need any other routes for home page. Let's keep things vague for privacy's sake(No splash screens with version numbers.)
public func routes(_ app: Application) throws {
    app.get { req in
        return req.redirect(to: "https://www.youtube.com/watch?v=RfiQYRn7fBg")
    }
    
    let routeController = RouteController()
    try app.register(collection: routeController)
    
            let misterRoutes = app.grouped("Rubus")
            misterRoutes.get(use: setRubusHandler)
            misterRoutes.get(":device",":mode", use: setRubusHandler)
            
}
public func setRubusHandler(_ req: Request) -> String {
    let mode = req.parameters.get("mode")
    let dev = req.parameters.get("device")
    print("Dev:\(dev) Mode:\(mode)")
    return "Dev:\(dev) Mode:\(mode)"
}
