//
//  demoPC.swift
//  demo
//
//  Created by Nguyễn Trung Hiếu on 7/15/20.
//  Copyright © 2020 Nguyễn Trung Hiếu. All rights reserved.
//

import UIKit
extension UIViewController{

    func HideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    @objc func DismissKeyboard(){

        view.endEditing(true)
    }
}

class demoPC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernametetfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    
    @IBOutlet weak var safeAreaBottom: NSLayoutConstraint!

    
    @IBAction func tap_login(_ sender: UIButton) {
        self.view.endEditing(true)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let phoneRegEx = "/(03|07|08|09|01[2|6|8|9])+([0-9]{8})\\b$"
        let result = usernametetfield.text?.range(of: emailRegEx, options:.regularExpression)
        let result1 = usernametetfield.text?.range(of: phoneRegEx, options:.regularExpression)

        if result == nil && (result1 == nil) {
            let alert = UIAlertController(title: "illegal", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true,completion: nil)
            
        }else {
            if(passwordtextfield.text!.count >= 6){
                let scr = storyboard?.instantiateViewController(withIdentifier: "homeScr") as! homeVC1
                scr.modalPresentationStyle = .fullScreen
                present(scr, animated: true, completion: nil)
                
            }
            else{
                let alert = UIAlertController(title: "illegal", message: nil, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    present(alert, animated: true,completion: nil)
            }
        }
    }
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
