//
//  BaseViewController.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController ,UINavigationControllerDelegate {
    
    //Variable: Activity spinner
    var spinner = UIActivityIndicatorView(style: .large)

    //MARK:- Set the status bar color to white
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        spinner.color = .black
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    //MARK:- Set the status bar color to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Set the status bar color to white
    func showOKAlert(titles : String,msg : String) {
        let alertController = UIAlertController(title: titles, message: msg, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    
    
    
    //MARK:- Show (or) Hide Activity
            @objc func showLoadingIndicator() {
                spinner.startAnimating()
            }
            
    //MARK:- Show (or) Hide Activity
        @objc func hideLoadingIndicator() {
            spinner.stopAnimating()
        }
        
    }

    ///Variable: Spinner view
    var vSpinner : UIView?

    //MARKE: Extention: UIViewController
    extension UIViewController {
        ///MARK:- Show Spinner
        func showSpinner(onView : UIView, setBgColor: Bool = true) {
            let spinnerView = UIView.init(frame: onView.bounds)
            spinnerView.backgroundColor = setBgColor ? UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5) : UIColor.clear
            let ai = UIActivityIndicatorView.init(style: .large)
            ai.assignColor(.black)
            ai.startAnimating()
            ai.center = spinnerView.center
            
            DispatchQueue.main.async {
                spinnerView.addSubview(ai)
                onView.addSubview(spinnerView)
            }
            
            vSpinner = spinnerView
        }
        
        ///MARK:- Remove Spinner
        func removeSpinner() {
            DispatchQueue.main.async {
                vSpinner?.removeFromSuperview()
                vSpinner = nil
            }
        }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
