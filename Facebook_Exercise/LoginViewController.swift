//
//  LoginViewController.swift
//  Facebook_Exercise
//
//  Created by Jason Demetillo on 9/11/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var inputsView: UIView!
    @IBOutlet var emailTextView: UITextField!
    @IBOutlet var passwordTextView: UITextField!
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    var loggingAlertView: UIAlertView?
    
    func doCheck()->(){
        println("doCheck")
        
        //
        self.loadingView.stopAnimating()
        
        //
        var email = self.emailTextView.text
        var password = self.passwordTextView.text
        
        self.loggingAlertView!.dismissWithClickedButtonIndex(0, animated: true)
        
        if email == "jay@yahoo.com" && password == "password" {
            // OK
            performSegueWithIdentifier("Connect", sender: self)
            
            
        } else {
            // ERROR
            UIAlertView(title: "Ew", message: "You are not Jay", delegate: self, cancelButtonTitle:"Ok").show()
        }
        
    }
    

    @IBAction func onLoad(sender: UIButton) {
        self.loadingView.startAnimating()
        delay(2,doCheck)
        
        self.loggingAlertView = UIAlertView (title: "Logging In", message: nil, delegate: self, cancelButtonTitle: nil)
        self.loggingAlertView!.show()
    }
    
    
    @IBAction func onEmailValueChange(sender: UITextField) {
        
        println("onEmailValueChange")
        
        if emailTextView.text=="" || passwordTextView.text==""{
            self.loginButton2.enabled=false
            println("disabled")
        }
        else{
            self.loginButton2.enabled=true
            println("enabled")
        }
    }
    
    @IBAction func onPasswordValueChange(sender: UITextField) {

        if emailTextView.text=="" || passwordTextView.text==""{
            self.loginButton2.enabled=false
            println("disabled")
        }
        else{
            self.loginButton2.enabled=true
            println("enabled")
        }

    }
    @IBOutlet var loginButton: UIView!
    @IBOutlet var loginButton2: UIButton!
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        println("LoginViewController - willShowKeyboard")
        
        var userInfo: NSDictionary = notification.userInfo!
        
        var kbSize: CGSize = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue().size
        println("height:\(kbSize.height), width: \(kbSize.width)")
        
        inputsView.frame.origin.y=160
        loginButton.frame.origin.y=kbSize.height-10
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        inputsView.frame.origin.y=189
        loginButton.frame.origin.y=265
        
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        loginButton2.enabled=false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
