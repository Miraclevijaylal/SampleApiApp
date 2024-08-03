//
//  DemoTableViewCell.swift
//  TableDemo
//
//  Created by Vijay Lal on 31/07/24.
//

import Foundation
import UIKit
class DemoTableViewCell: UITableViewCell {
    lazy var downloadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = -1
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DemoTableViewCell {
    private func initViews() {
        self.contentView.addSubview(downloadImageView)
        downloadImageView.translatesAutoresizingMaskIntoConstraints = false
        [downloadImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         downloadImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
         downloadImageView.widthAnchor.constraint(equalToConstant: 30),
         downloadImageView.heightAnchor.constraint(equalToConstant: 30)
        ].forEach({ $0.isActive = true })
        self.contentView.addSubview(headingLabel)
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        [headingLabel.leadingAnchor.constraint(equalTo: downloadImageView.trailingAnchor, constant: 16),
         headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         headingLabel.centerYAnchor.constraint(equalTo: downloadImageView.centerYAnchor, constant: 0),
        ].forEach({ $0.isActive = true })
        self.contentView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        [contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         contentLabel.topAnchor.constraint(equalTo: downloadImageView.bottomAnchor, constant: 16),
         contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ].forEach({ $0.isActive = true })
    }
}
