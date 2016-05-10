//
//  ViewController.swift
//  PeterPan_0505
//
//  Created by Spade Jack on 5/5/16.
//  Copyright © 2016 galileo.jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var leadingFirstTF: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bigView = UIView.init(frame: CGRectMake(50, 50, 150, 150))
        bigView.backgroundColor = UIColor.blueColor()
        bigView.layer.borderWidth = 4
        bigView.layer.borderColor = UIColor.redColor().CGColor
        
        let smallView = UIView.init(frame: CGRectMake(75, 75, 100, 100))
        smallView.backgroundColor = UIColor.brownColor()
        let angle = CGFloat(M_PI/4.0)
        smallView.transform = CGAffineTransformMakeRotation(angle)
        
        self.view.addSubview(bigView)
        self.view.addSubview(smallView)
        
    }

    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    override func viewWillDisappear(animated: Bool) {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        super.viewWillDisappear(animated)
    }
    /*
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.leadingFirstTF.constant = self.leadingFirstTF.constant + 50.0
        
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
      
        if textField.tag == 100 {
            print("100")
            secondTextField.becomeFirstResponder()
        }else{
            print("101")
            secondTextField.resignFirstResponder()
        }
            
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {

        if textField.tag == 100 {
            print("100")
        }else{
            print("101")
        }

    }
    
    
    @IBAction func imButton(sender: AnyObject) {
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChiMinViewController")
        viewController?.modalTransitionStyle = .FlipHorizontal
        
        self.presentViewController(viewController!, animated: true, completion: nil)
    }
}

