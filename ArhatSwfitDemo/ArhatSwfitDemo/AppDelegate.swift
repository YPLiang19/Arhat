//
//  AppDelegate.swift
//  ArhatSwfitDemo
//
//  Created by yongpengliang Xia on 2022/3/8.
//

import UIKit
import Arhat

let aes128Key = "123456"
let aes128Iv = "abcdef"

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func encryptPlainScirptToDocument() -> Bool {
        let scriptURL = Bundle.main.url(forResource: "demo.mg", withExtension: nil)
        let script =  try? String.init(contentsOf: scriptURL!)
        guard script != nil else {
            return false
        }
        let scriptData = script!.data(using: String.Encoding.utf8)
        guard scriptData != nil else {
            return false
        }
        let nsscriptData = NSData.init(data: scriptData!)
        
        let enecryptedData  = aesEncrypt (nsscriptData as Data, aes128Key, aes128Iv)
        guard enecryptedData != nil else {
            return false
        }
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let encryptedScriptPath = docPath!.appending("/demo_encrypted.mg")
        let encryptedScriptURL = URL.init(fileURLWithPath: encryptedScriptPath)
        try! enecryptedData.write(to: encryptedScriptURL)
        return true
    }



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let writeResult = encryptPlainScirptToDocument();
        if !writeResult {
            return true
        }
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let encryptedScriptPath = docPath!.appending("/demo_encrypted.mg")
        let context = ARHATContext.init(key1: aes128Key, key2: aes128Iv, token: "")
        
        let data = NSData.init(contentsOfFile: encryptedScriptPath)
        context.run(with: data as! Data)

        
        return true
    }




}


