//
//  Extensions.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url : URL){
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
  
  
    @IBInspectable var shadowOffset: CGSize{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    @IBInspectable var shadowColor: UIColor{
        get{
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    
    
}
