import Foundation
import UIKit

@IBDesignable
extension UIView {
//    func showLoadingView(onView: UIView? = nil, completionBlock: LoadingCompletionBlock? = nil) {
//        LottieLoadingView.manager.showLoadingView(onView: onView, completionBlock: completionBlock)
//    }
//
//    func hideLoadingView(
//        relatedObject: Any? = nil,
//        status: LoadingStatus = .success,
//        image: UIImage? = nil,
//        title: String = "",
//        subtitle: String = "",
//        completionBlock: LoadingCompletionBlock? = nil
//    ) {
//        LottieLoadingView.manager.hideLoadingView(withDelay: nil, image: image, title: title, subtitle: subtitle, completionBlock: completionBlock, status: status, relatedObject: relatedObject)
//    }

    func roundTop() {
        let radius = (bounds.height / 2) + pow(bounds.width, 2) / (8 * bounds.height)
        let offsetAngle = asin(bounds.width / (2 * radius))
        let startAngle = (3 * CGFloat.pi / 2) - offsetAngle
        let endAngle = (3 * CGFloat.pi / 2) + offsetAngle
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.minY + radius), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    func drawDashedLine() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [4, 3]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }

    func blur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }

    func unBlur() {
        for subview in subviews where subview is UIVisualEffectView {
            subview.removeFromSuperview()
        }
    }

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func animate180Rotation(isReversed: Bool, duration: TimeInterval) {
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        var values = [Double.pi, Double.pi * 3 / 4, Double.pi / 2.0, Double.pi / 4.0, 0.0]
        if isReversed {
            values.reverse()
        }
        rotation.values = values
        rotation.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
        rotation.duration = duration
        rotation.fillMode = .forwards
        rotation.isRemovedOnCompletion = false
        rotation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        self.layer.add(rotation, forKey: nil)
    }
}

extension UIView {
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    @IBInspectable var blurEffect: Bool {
        get { false }
        set {
            DispatchQueue.main.async {
                if newValue {
                    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                    blurEffectView.frame = self.bounds
                    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    self.addSubview(blurEffectView)
                }
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var cornerRadiusbottomLeft: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            self.roundCorners(.bottomLeft, radius: newValue)
            //            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
