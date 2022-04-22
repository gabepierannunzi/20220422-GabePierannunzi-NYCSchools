
import SwiftUI

class Animations {
    
    static let standard = Animation.interactiveSpring(response: 0.8,
                                                      dampingFraction: 0.8,
                                                      blendDuration: 0.2)
    
    static let present = Animation.interactiveSpring(response: 0.8,
                                                     dampingFraction: 1,
                                                     blendDuration: 0.2)
    
    static let pop = Animation.interactiveSpring(response: 0.8,
                                                 dampingFraction: 0.5,
                                                 blendDuration: 0.2)
    
}
