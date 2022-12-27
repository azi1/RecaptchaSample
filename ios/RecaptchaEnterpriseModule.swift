//
//  RecaptchaEnterpriseModule.swift
//  NativeModuleTest
//
//  Created by rakbank on 26/12/2022.
//

import Foundation
import RecaptchaEnterprise

@available(iOS 13.0.0, *)
@objc(RecaptchaEnterpriseModule)
class RecaptchaEnterpriseModule: NSObject {
  
  private var recaptchaClient: RecaptchaClient?
  
  @available(iOS 14.0, *)
  @objc(loadcaptcha:resolver:rejecter:)
  func loadcaptcha (captchaKey:String,resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock){
    
    Recaptcha.getClient(
      siteKey: "6LdLB6kjAAAAAFprx6T5TMYdfhsRmTszrD46Aqj5") { recaptchaClient, error in
        
        if((error) != nil) {
          resolve("error")
        } else {
          resolve("recaptchaClient")
        }
      
      }
  }

  
  
  func a() async {
    if #available(iOS 14.0, *) {
      let (recaptchaClient, error) = await Recaptcha.getClient(
        siteKey: "6LdLB6kjAAAAAFprx6T5TMYdfhsRmTszrD46Aqj5")
      if let recaptchaClient = recaptchaClient {
        self.recaptchaClient = recaptchaClient
        print(recaptchaClient, "got recaptchaClient");
      }
      if let error = error {
        print("RecaptchaClient creation error: \(error).")
      }
    } else {
      // Fallback on earlier versions
      print("dsdsds")
    }
};
  
  func execute() async {
    guard let client = self.recaptchaClient else {
      print("Client not initialized correctly.")
      return
    }
    let (token, error) = await client.execute(
      RecaptchaAction(action: .login))
    if let token = token {
      print(token.recaptchaToken)
    } else {
      print(error)
    }
  }
}
