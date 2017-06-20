//
//  CustomView.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 20/06/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {

    @IBInspectable var cornerRadius : CGFloat = 0 {
    
        didSet{
        layer.cornerRadius = self.cornerRadius
        }
    }

}
