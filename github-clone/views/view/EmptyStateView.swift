//
//  EmptyStateView.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import UIKit

class EmptyStateView: UIView {

   let messageLabel    = TitleLabel(textAlignment: .center, fontSize: 28)
      let logoImageView   = UIImageView()

      override init(frame: CGRect) {
          super.init(frame: frame)
          configure()
      }
      
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      
      init(message: String) {
          super.init(frame: .zero)
          messageLabel.text = message
          configure()
      }
      
      
      private func configure() {
          addSubview(messageLabel)
          addSubview(logoImageView)
          
          messageLabel.numberOfLines  = 3
          messageLabel.textColor      = .secondaryLabel
          
          logoImageView.image         = UIImage(named: "empty-state-logo")
          logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -50 : -150
        let messageLabelCenterYConstraint = messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant)
        messageLabelCenterYConstraint.isActive = true
       
          
          NSLayoutConstraint.activate([
              messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
              messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
              messageLabel.heightAnchor.constraint(equalToConstant: 200),
              
              logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
              logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
              logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
              logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
          ])
      }
  }


