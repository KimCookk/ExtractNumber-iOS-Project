
import Foundation
import UIKit

extension Array {
    subscript (safe index: Int) -> Element? {
        
        return indices ~= index ? self[index] : nil
    }
}

extension UIColor {
    static func getRandom() -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
                
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
