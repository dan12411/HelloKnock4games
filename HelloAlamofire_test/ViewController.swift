//
//  ViewController.swift
//  HelloAlamofire_test
//
//  Created by 洪德晟 on 2017/2/8.
//  Copyright © 2017年 洪德晟. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // 登入
    @IBAction func LogInButton(_ sender: Any) {
        
        guard let userName = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let logInParameters = ["name": userName, "pwd": password]
        LogIn (logInParameters: logInParameters)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // http 資料
    let logInUrl = "http://54.64.163.121:3443"
    
    // API 1 - 登入
    func LogIn (logInParameters: [String:String]) {
        Alamofire.request(logInUrl, method: .post, parameters: logInParameters, encoding: JSONEncoding.default, headers: nil).responseJSON {
            (response) in
            
            guard let result = response.result.value else { return }
            
            guard let newResult = result as? [String: AnyObject] else { return }
            
            guard let token = newResult["token"] as? [String: AnyObject] else { return }
            
            guard let myToken = token["token"] as? String else { return }
            
            // Save token to client side
            UserDefaults.standard.set(myToken, forKey: "accessToken")
            UserDefaults.standard.synchronize()
            print("====token: \(myToken)====")
            
            // 將帳號密碼記載在附件中的document
            let documentsPath = NSHomeDirectory() + "/Documents"
            
            let filePath = documentsPath + "userInfo.txt"
            
            let dictToSave = NSDictionary(dictionary: logInParameters)
            
            dictToSave.write(toFile: filePath, atomically: true)
            
            // 嘗試存取帳號密碼，測試是否存入document
            if let loadedDict = NSDictionary(contentsOfFile: filePath) as? [String:String] {
                print("====userData: \(loadedDict)====")
            }
            
            // 確認有token & 帳密存入document後，進入登入畫面
            self.performSegue(withIdentifier: "goToView2", sender: nil)
            // 登入後將輸入欄位清空
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
