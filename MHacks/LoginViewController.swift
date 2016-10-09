//
//  LoginViewController.swift
//  MHacks
//
//  Created by Francis Zamora on 10/8/16.
//  Copyright © 2016 Francis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let client = Client()
        
        client.login(username: username.text!, password: password.text!, onSuccess: {
            // Login was a success!
            
            // Navigate to the next view
            self.performSegue(withIdentifier: "LoginSuccess", sender: self)
        }) { 
            // Login was a failure!
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
