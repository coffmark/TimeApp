//
//  AppDelegate.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseUI
import FirebaseFirestoreSwift
import Resolver


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        
        
        
        Messaging.messaging().delegate = self
        setRemoteNotification(application: application)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Firebase Auth
    // Google Facebook Twitter認証の場合関数を書かないといけない
    
    //電話番号認証の場合に通知をHandelできるかチェックする関数
    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void){
        if Auth.auth().canHandleNotification(notification){
            completionHandler(.noData)
            return
        }
        //エラーの時の処理をかく
    }

    
    
    
    
    
    
    

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "TimeApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}



// MARK: - Firebase Push 通知設定

extension  AppDelegate: UNUserNotificationCenterDelegate{
    func setRemoteNotification(application: UIApplication){
        //Delegate の設定
        UNUserNotificationCenter.current().delegate = self
        //プッシュ通知受信の許可を求める。
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in})
        application.registerForRemoteNotifications()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    // プッシュ通知に対しタッチ等のアクションを行った時に呼ばれる。
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        _ = response.notification.request.content.userInfo
        // 送信時に入れた情報をここで取得。
    }
}



extension AppDelegate: MessagingDelegate {
    // fcmTokenを受け取った時に呼ばれる。
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        if let uid = Auth.auth().currentUser?.uid {  //ログイン中のユーザーIDを取得
            self.setFcmToken(userId: uid, fcmToken: fcmToken)
        }
    }
    
    func setFcmToken(userId: String, fcmToken: String) {
        let reference = Database.database().reference().child("user").child(userId).child("fcm_token")
        UserDefaults.standard.set(fcmToken, forKey: "fcmToken")
        reference.setValue(fcmToken)
    }
}
