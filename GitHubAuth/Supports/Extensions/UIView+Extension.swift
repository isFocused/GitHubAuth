//
//  UIView+Extension.swift
//  GitHubAuth
//
//  Created by Дарья Полякова on 14.05.2022.
//

import UIKit

extension UIView {
    
    func pinAllEdgesSuperView() {
        updateTranslatesAutoresizingMaskIntoConstraints()
        guard let superView = superview else {
            assertionFailure("Вью не может быть прекреплён пока не будет добавлен на супер вью")
            return
        }
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    private func updateTranslatesAutoresizingMaskIntoConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
