//
//  UIView+Layout.swift
//  TKLayout
//
//  Created by 郭景豪 on 2020/6/10.
//  Copyright © 2020 Tank. All rights reserved.
//

import Foundation

import UIKit

// Reference Video: https://youtu.be/iqpAP7s3b-8

public extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        anchoredConstraints.active()
        
        return anchoredConstraints
    }
    
    @discardableResult
    func fillSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let superviewTopAnchor = superview?.topAnchor {
            anchoredConstraints.top = topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top)
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom)
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left)
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right)
        }
        
        anchoredConstraints.active()
        
        return anchoredConstraints
    }
    
    @discardableResult
    func fillSuperviewSafeArea(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let superviewTopAnchor = superview?.safeArea.topAnchor {
            anchoredConstraints.top = topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top)
        }
        
        if let superviewBottomAnchor = superview?.safeArea.bottomAnchor {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom)
        }
        
        if let superviewLeadingAnchor = superview?.safeArea.leadingAnchor {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left)
        }
        
        if let superviewTrailingAnchor = superview?.safeArea.trailingAnchor {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right)
        }
        
        anchoredConstraints.active()
        
        return anchoredConstraints
    }
    
    @discardableResult
    func centerInSuperview(size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()

        if let superviewCenterXAnchor = superview?.centerXAnchor {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superviewCenterXAnchor)
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superviewCenterYAnchor)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        anchoredConstraints.active()
        
        return anchoredConstraints
    }
    
    @discardableResult
    func centerXInSuperview(constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            let constraint = centerXAnchor.constraint(equalTo: superViewCenterXAnchor,constant: constant)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        }
        return nil
    }
    
    @discardableResult
    func centerYInSuperview(constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            let constraint = centerYAnchor.constraint(equalTo: centerY,constant: constant)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        }
        return nil
    }
    
    @discardableResult
    func constrainWidth(constant: CGFloat, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func constrainHeight(constant: CGFloat, priority: UILayoutPriority = .init(1000))  -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func aspectRation(_ ratio: CGFloat, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: ratio, constant: 0)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func alignmentTop(to view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func alignmentBottom(to view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func alignmentLeading(to view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func alignmentTrailing(to view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func alignmentCenterX(to view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func alignmentCenterY(to view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .init(1000)) -> NSLayoutConstraint {
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
}

public struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height, centerX, centerY: NSLayoutConstraint?
    func active(){
        [top, leading, bottom, trailing, width, height,centerX,centerY].forEach{ $0?.isActive = true }
    }
}

public protocol LayoutGuideProvider {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuideProvider { }
extension UILayoutGuide: LayoutGuideProvider {}
public extension LayoutGuideProvider {
    var t: NSLayoutYAxisAnchor {
        return topAnchor
    }
    var b: NSLayoutYAxisAnchor {
        return bottomAnchor
    }
    var l: NSLayoutXAxisAnchor {
        return leadingAnchor
    }
    var r: NSLayoutXAxisAnchor {
        return trailingAnchor
    }
}

public extension UIView {
    var safeArea: LayoutGuideProvider {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return self
        }
    }
    
}

public extension UIView {
    var t: NSLayoutYAxisAnchor {
        return topAnchor
    }
    var b: NSLayoutYAxisAnchor {
        return bottomAnchor
    }
}

public extension UIView {
    var l: NSLayoutXAxisAnchor {
        return leadingAnchor
    }
    var r: NSLayoutXAxisAnchor {
        return trailingAnchor
    }
}

public extension UIEdgeInsets {
     init(t: CGFloat = 0, l: CGFloat = 0, b: CGFloat = 0, r: CGFloat = 0) {
        self.init(top: t, left: l, bottom: b, right: r)
    }
}
