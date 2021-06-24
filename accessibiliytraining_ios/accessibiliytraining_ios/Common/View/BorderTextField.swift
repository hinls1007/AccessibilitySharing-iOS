//
//  BorderTextfield.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 02/06/2021.
//

import UIKit

class BorderTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    public var textInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }

    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    open override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}

