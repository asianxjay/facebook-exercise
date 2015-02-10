//
//  FeedViewController.swift
//  Facebook_Exercise
//
//  Created by Jason Demetillo on 9/11/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var feedImageView: UIImageView!
    
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        scrollView.alpha = 0;
        loadingView.startAnimating();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
        
        delay(2, { () -> () in
            self.loadingView.stopAnimating();
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.scrollView.alpha = 1;
            })
        })
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
