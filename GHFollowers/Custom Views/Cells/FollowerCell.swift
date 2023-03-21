//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Ian Brault on 3/15/23.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(follower: Follower) {
        usernameLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { [weak self] (image) in
            guard let self = self else { return }
            // NOTE: need to update UI on the main thread
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }

    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)

        let padding: CGFloat =  8

        NSLayoutConstraint.activate([
            // NOTE: modified as part of iOS15 port
            // leaving commented-out code here for posterity until I reach that video
            // avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            // NOTE: modified as part of iOS15 port
            // leaving commented-out code here for posterity until I reach that video
            // avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            // NOTE: modified as part of iOS15 port
            // leaving commented-out code here for posterity until I reach that video
            // avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            // NOTE: modified as part of iOS15 port
            // leaving commented-out code here for posterity until I reach that video
            // usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            // NOTE: modified as part of iOS15 port
            // leaving commented-out code here for posterity until I reach that video
            // usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
