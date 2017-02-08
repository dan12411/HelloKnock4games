//
//  AppDelegate.swift
//  HelloAlamofire_test
//
//  Created by 洪德晟 on 2017/2/7.
//  Copyright © 2017年 洪德晟. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // 在App被喚醒後，自動extend token。
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        let documentsPath = NSHomeDirectory() + "/Documents"
        let filePath = documentsPath + "userInfo.txt"
        guard let loadedDict = NSDictionary(contentsOfFile: filePath) as? [String:String] else { return }
        print("====userData: \(loadedDict)====")
        
        let logInUrl = "http://54.64.163.121:3443"

        Alamofire.request(logInUrl, method: .post, parameters: loadedDict, encoding: JSONEncoding.default, headers: nil).responseJSON {
            (response) in
            
            guard let result = response.result.value else { return }
            
            guard let newResult = result as? [String: AnyObject] else { return }
            
            guard let token = newResult["token"] as? [String: AnyObject] else { return }
            
            guard let myToken = token["token"] as? String else { return }
            
            // Save token to client side
            UserDefaults.standard.set(myToken, forKey: "accessToken")
            UserDefaults.standard.synchronize()
            print("====NewToken: \(myToken)====")
        }
        
    }
}

