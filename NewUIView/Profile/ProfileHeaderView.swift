//
//  ProfileHeaderView.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewController() {
        backgroundColor = .lightGray
        addSubView()
        setupConstraint()
    }

    private func addSubView() {

    }

    func setupConstraint() {

    }
}


