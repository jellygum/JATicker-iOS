/**
 Copyright 2016 Jay Ayres

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import UIKit

extension UIImage {
    /**
     Return the image with the specified name, first checking in the JATickerView bundle and then
     falling back to the main bundle if not found

     - parameter name: Name of the image to load
     - returns: Image, or nil if it could not be loaded
     */
    public class func jaTickerViewImageNamed(name: String) -> UIImage? {
        let bundleByClass = Bundle(for: JATickerView.self)
        if let image = UIImage(named: name,
                               in: bundleByClass,
                               compatibleWith: nil) {
            return image
        }

        if let bundleByName = Bundle(identifier: JATickerViewConstants.JATickerBundleName) {
            if let image = UIImage(named: name,
                                   in: bundleByName,
                                   compatibleWith: nil) {
                return image
            }
        }

        return UIImage(named: name)
    }

    /**
     Load a dot image of the specified color

     - parameter color: The dot color
     - returns: Dot image, or nil if none could be loaded
     */
    public class func jaTickerViewDotImage(color: JATickerDotColor) -> UIImage? {
        switch color {
        case JATickerDotColor.DefaultOn, JATickerDotColor.Green:
            return UIImage.jaTickerViewImageNamed(name: "greendot")
        case JATickerDotColor.DefaultOff, JATickerDotColor.Black:
            return UIImage.jaTickerViewImageNamed(name: "blackdot")
        case JATickerDotColor.Yellow:
            return UIImage.jaTickerViewImageNamed(name: "yellowdot")
        case JATickerDotColor.Red:
            return UIImage.jaTickerViewImageNamed(name: "reddot")
        case JATickerDotColor.Blue:
            return UIImage.jaTickerViewImageNamed(name: "bluedot")
        case JATickerDotColor.Orange:
            return UIImage.jaTickerViewImageNamed(name: "orangedot")
        }
    }

    /**
     Load the default dot image for the on or off state

     - parameter isOn: Whether to load the default for the on state
     - returns: Dot image, or nil if none could be loaded
     */
    public class func jaTickerViewDefaultDotColorForState(isOn: Bool) -> UIImage? {
        return isOn ? jaTickerViewDotImage(color: JATickerDotColor.DefaultOn) :
            jaTickerViewDotImage(color: JATickerDotColor.DefaultOff)
    }
}
