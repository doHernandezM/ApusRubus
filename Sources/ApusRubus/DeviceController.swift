//
//  File.swift
//
//
//  Created by Dennis Hernandez on 9/13/21.
//

import Foundation
import SwiftyPi

///Access all the vapor goodness here. You should not need to modify any of the vapor stuff directly, however, this code blocks the UI. So do not use vapor if you do not need it.
public var vaporController: VaporController? = nil

///Controller for SwiftyPi devices.
///
///You can access your devices and their values directly or have the controller do it for you.
open class DeviceController {
    public typealias Devices = [String:SwiftyPiDevice]
    private var devices:Devices = [:]
    private var timer:SwiftyPi.Timer? = nil
    private var timeInterval:TimeInterval = 0.1
    private var loops:Int = 0
    
    ///Init the controller with the default time interval and loop
    public init(runSever:Bool, devices: [SwiftyPiDevice]) {
        if runSever {
            vaporController = VaporController()
            vaporController?.start()
        }
        
        self.add(devices: devices)
    }
    
    ///Init the controller with custom time interval and loop
    public init(runSever:Bool, timeInterval: TimeInterval, loops: Int, devices: [SwiftyPiDevice]) {
        if runSever {
            vaporController = VaporController()
            vaporController?.start()
        }
        
        self.add(devices: devices)
        
        timer = Timer(timeInterval: self.timeInterval, loops: self.loops)
        timer?.handler = { [self] in
            action()
        }
    }
    
    ///Set off action for all of the devices.
    func action() {
        self.devices.forEach { _,device in
            device.action()
        }
    }
    
    ///Add device to controller's device dictionary.
    open func add(devices:[SwiftyPiDevice]) {
        devices.forEach { device in
            self.devices[device.state.name] = device
        }
    }
    
    open func stop() {
        vaporController?.stop()
    }
    
    required public init() {
        self.stop()
    }
    
}
