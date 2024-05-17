import Foundation
import BitalinoCpp

public struct BitalinoLibrary {
    var bitalino: BITalino?
    
    mutating func connect(address: String) {
        bitalino = BITalino(address);
    }
    
    mutating func getVersion() -> String {
        let version = bitalino?.version()
        
        return String(describing: version)
    }
    
    mutating func battery(threshold: Int32) {
        bitalino?.battery(threshold)
    }
    
    mutating func pwm(pwmOutput: Int32) {
        bitalino?.pwm(pwmOutput)
    }
    
    mutating func getState() -> BITalino.State? {
        if bitalino != nil  {
            return bitalino!.state()
        } else {
            return nil
        }
    }
    
    mutating func start(simplaRate: Int32, channels: BITalino.Vint, simulated: Bool) {
        bitalino?.start(simplaRate, channels, simulated)
    }
    
    mutating func stop() {
        bitalino?.stop()
    }
    
    mutating func readFrames() -> BITalino.Frame {
        var frames = BITalino.VFrame(100)
        bitalino?.read(&frames)
        
        var frame = frames[0];  // get a reference to the first frame of each 100 frames block
        
        return frame
    }
    
}
