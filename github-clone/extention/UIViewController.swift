//
//  UIViewController.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = Alert(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle  = .overFullScreen
            alert.modalTransitionStyle    = .crossDissolve
            self.present(alert, animated: true)
        }
    }
    
    func presentSafari(with url: URL) {
        let safari = SFSafariViewController(url: url)
        safari.preferredControlTintColor = .systemGreen
        present(safari, animated: true)
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        activityIndicator.startAnimating()
         
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
        
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptystateView = EmptyStateView(message: message)
        emptystateView.frame = view.bounds
        view.addSubview(emptystateView)
    }
}
