import Foundation
import BitalinoCpp

public struct BitalinoLibrary {
    var bitalino: BITalino?
    
    public mutating func connect(address: String) {
        self.bitalino = BITalino(address);
    }
    
    public mutating func getVersion() -> String {
        let version = bitalino?.version()
        
        return String(describing: version)
    }
    
    public mutating func battery(threshold: Int32) {
        bitalino?.battery(threshold)
    }
    
    public mutating func pwm(pwmOutput: Int32) {
        bitalino?.pwm(pwmOutput)
    }
    
    public mutating func getState() -> BITalino.State? {
        if bitalino != nil  {
            return bitalino!.state()
        } else {
            return nil
        }
    }
    
    public mutating func start(simplaRate: Int32, channels: BITalino.Vint, simulated: Bool) {
        bitalino?.start(simplaRate, channels, simulated)
    }
    
    public mutating func stop() {
        bitalino?.stop()
    }
    
    public mutating func readFrames() -> BITalino.Frame {
        var frames = BITalino.VFrame(100)
        bitalino?.read(&frames)
        
        var frame = frames[0];  // get a reference to the first frame of each 100 frames block
        
        return frame
    }
    
}
