//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Ian Brault on 3/21/23.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
