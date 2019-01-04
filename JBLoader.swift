//
//  JBLoader.swift
//
//  Created by Jay on 14/03/18.
//

import UIKit

class JBLoader: NSObject {
    public static var loadView: UIView!
    public static var viewBack: UIView!
    public static var lblLoading: UILabel!
    public static var spinningWheel: UIActivityIndicatorView!
    
    
    public static func showLoadingView() {
        if (loadView == nil) {
            loadView = UIView.init(frame: (UIApplication.shared.delegate?.window??.frame)!)
            loadView.isOpaque = false
            loadView.backgroundColor = UIColor.clear
            
            viewBack = UIView.init(frame: CGRect.init(x: 80, y: 230, width: 160, height: 50))
            viewBack.backgroundColor = UIColor.black
            viewBack.alpha = 0.7
            viewBack.layer.masksToBounds = false;
            viewBack.layer.cornerRadius = 5;
            
            spinningWheel = UIActivityIndicatorView.init(frame: CGRect.init(x: 5.0, y: 10.0, width: 30.0, height: 30.0))
            spinningWheel.color = UIColor.white
            spinningWheel.startAnimating()
            
            viewBack.addSubview(spinningWheel)
            
            lblLoading = UILabel.init(frame: CGRect.init(x: 40, y: 0, width: 110, height: 50))
            lblLoading.backgroundColor = UIColor.black
            lblLoading.textAlignment = .center
            lblLoading.text = "Please wait...";
            lblLoading.numberOfLines = 2;
            lblLoading.textColor = UIColor.white
            lblLoading.font = UIFont.systemFont(ofSize: 16.0)
            
            loadView.alpha = 0
            viewBack.addSubview(lblLoading)
            loadView.addSubview(viewBack)
            UIView.animate(withDuration: 0.2) {
                loadView.alpha = 1
            }
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                let x: Float = Float((loadView.frame.size.width / 2) - (viewBack.frame.size.width / 2))
                let y: Float = Float((loadView.frame.size.height / 2) - (viewBack.frame.size.height / 2))
                viewBack.frame = CGRect.init(x: CGFloat(x), y: CGFloat(y), width: 160.0, height: 50.0)
            } else {
                let x: Float = Float((loadView.frame.size.width / 2) - (viewBack.frame.size.width / 2))
                let y: Float = Float((loadView.frame.size.height / 2) - (viewBack.frame.size.height / 2))
                viewBack.frame = CGRect.init(x: CGFloat(x), y: CGFloat(y), width: 160.0, height: 50.0)
            }
            
            if(loadView.superview == nil) {
                UIApplication.shared.delegate?.window??.addSubview(loadView)
            }
            
        }
    }
    
    public static func hideLoadingView() {
        if loadView != nil {
            UIView.animate(withDuration: 0.2, animations: {
                loadView.alpha = 0
            }) { (success) in
                if loadView != nil {
                    loadView.removeFromSuperview()
                    loadView = nil
                }
            }
            
        }
        
        
    }
}
