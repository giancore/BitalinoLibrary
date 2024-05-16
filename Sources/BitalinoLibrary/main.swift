import Foundation
import Bitalino

var bitalino: BITalino?

func connect(address: String) {
    bitalino = BITalino(address);
}

func getVersion() -> String {
    let version = bitalino?.version()
    
    return String(describing: version)
}

func battery(threshold: Int32) {
    bitalino?.battery(threshold)
}

func pwm(pwmOutput: Int32) {
    bitalino?.pwm(pwmOutput)
}

func getState() -> BITalino.State? {
    if bitalino != nil  {
        return bitalino!.state()
    } else {
        return nil
    }
}

func start(simplaRate: Int32, channels: BITalino.Vint, simulated: Bool) {
    bitalino?.start(simplaRate, channels, simulated)
}

func stop() {
    bitalino?.stop()
}

func readFrames() -> BITalino.Frame {
    var frames = BITalino.VFrame(100)
    bitalino?.read(&frames)

    var frame = frames[0];  // get a reference to the first frame of each 100 frames block

    return frame
}
