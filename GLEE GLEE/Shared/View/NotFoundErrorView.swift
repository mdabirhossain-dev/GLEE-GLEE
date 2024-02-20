//
//  NotFoundErrorView.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import UIKit

class NotFoundErrorView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(resource: .notFound)
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .appIconColor
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "No Data Found"
        label.font = .poppins(.medium_500, size: 20.0)
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 183),
            imageView.heightAnchor.constraint(equalToConstant: 135),
            
            errorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
