//
//  MyViewController.swift
//  HelloAlamofire_test
//
//  Created by 洪德晟 on 2017/2/8.
//  Copyright © 2017年 洪德晟. All rights reserved.
//

import UIKit
import Alamofire

class MyViewController: UIViewController {

    // 登出
    @IBAction func LogOutButton(_ sender: Any) {
        // 返回前一頁
        let _ = navigationController?.popViewController(animated: true)
        // 將使用者帳號密碼從Client Side刪除
        let documentsPath = NSHomeDirectory() + "/Documents"
        let filePath = documentsPath + "userInfo.txt"
        do {
            try FileManager.default.removeItem(atPath: filePath)
        } catch {
            
        }
    }
    
    // 取得會員列表
    @IBAction func GetMemberButton(_ sender: Any) {
        GetMemberList()
    }
    
    // 新增會員
    @IBAction func CreateMemberButton(_ sender: Any) {
        CreateMember()
    }
    
    // http 資料
    let memberUrl = "http://54.64.163.121:3443/member"
    let createMemberParameters = ["name" : "XXXXXXX"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // API 2 - 取得會員列表
    func GetMemberList() {
        
        // 將此token放置header中
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": accessToken,
            "Accept": "application/json"
        ]
        
        Alamofire.request(memberUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON {
            (response) in
            
            guard let result = response.result.value else { return }
            
            print(result)
        }
    }
    
    // API 3 - 新增會員
    func CreateMember() {
        
        // 將此token放置header中
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": accessToken,
            "Accept": "application/json"
        ]
        
        Alamofire.request(memberUrl, method: .post, parameters: createMemberParameters, encoding: JSONEncoding.default, headers: headers).responseJSON {
            (response) in
            
            guard let result = response.result.value else { return }
            
            print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
