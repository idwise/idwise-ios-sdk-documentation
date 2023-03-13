//
//  LoadingView.swift
//  DynamicJourneyDemoApp
//
//  Created by Hafiz Ahsan on 02/03/2023.
//

import Foundation
import UIKit

public enum LoaderPosition {
    case middle
    case lower
}
public class LoadingView {

    //internal static var spinner: UIActivityIndicatorView?
    internal static var spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
    internal static var loadingTextLabel = UILabel()
    internal static var viewForActivityIndicator = UIView()
    internal static var blurEffect = UIBlurEffect(style: .dark)
    internal static var blurEffectView = BlurEffectView()//UIVisualEffectView(effect: blurEffect)

  

    public static func show(message: String? = nil,font: UIFont? = UIFont.systemFont(ofSize: 16,weight: .bold)
                            ,position: LoaderPosition = .middle) {

        if let window = UIApplication.shared.keyWindow {
            DispatchQueue.main.async {
                let frame = UIScreen.main.bounds

                self.viewForActivityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
                self.viewForActivityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                blurEffectView.frame = window.bounds
                //blurEffectView.alpha = 0.35
                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                let blurEffectLight = UIBlurEffect(style: .light)
                if isDarkMode() {
                    blurEffectView.effect = blurEffectLight
                }
                window.addSubview(blurEffectView)
                window.addSubview(self.viewForActivityIndicator)
                
                if position == .lower {
                    self.spinner.center = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 1.7)
                } else {
                    self.spinner.center = window.center
                }
                
                self.loadingTextLabel.textColor = UIColor.white
                if let msg = message {
                    self.loadingTextLabel.text = msg
                }
                self.loadingTextLabel.font = font
              
                
                self.loadingTextLabel.sizeToFit()
                self.loadingTextLabel.center = CGPoint(x: self.spinner.center.x, y: self.spinner.center.y + 40)
                self.viewForActivityIndicator.addSubview(self.loadingTextLabel)
                
                self.spinner.hidesWhenStopped = true
                if #available(iOS 13.0, *) {
                    spinner.style = UIActivityIndicatorView.Style.large
                } else {
                    // Fallback on earlier versions
                    spinner.style = .whiteLarge
                }
                self.spinner.color = .white
                self.viewForActivityIndicator.addSubview(self.spinner)
                self.spinner.startAnimating()
                
            }
            
        }
           
    }

    public static func hide() {

        DispatchQueue.main.async {
            self.blurEffectView.removeFromSuperview()
            self.viewForActivityIndicator.removeFromSuperview()
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
        }
    }


}

class BlurEffectView: UIVisualEffectView {
    
    var animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
    
    override func didMoveToSuperview() {
        guard let superview = superview else { return }
        backgroundColor = .clear
        frame = superview.bounds //Or setup constraints instead
        setupBlur()
    }
    
    private func setupBlur() {
        animator.stopAnimation(true)
        effect = nil

        animator.addAnimations { [weak self] in
            self?.effect = UIBlurEffect(style: .dark)
        }
        animator.fractionComplete = 0.3   //This is your blur intensity in range 0 - 1
    }
    
    deinit {
        animator.stopAnimation(true)
    }
}

func isDarkMode() -> Bool {
    return  UIScreen.main.traitCollection.userInterfaceStyle == .dark
}
