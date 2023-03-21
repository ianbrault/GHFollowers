//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Ian Brault on 3/21/23.
//

import UIKit

extension UITableView {

    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
