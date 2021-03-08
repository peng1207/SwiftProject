//
//  DataBase.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import RealmSwift

class DataTool  {
    /// 配置数据库
     class func configRealm(){
        /// 如果要存储的数据模型属性发生变化,需要配置当前版本号比之前大
        let dbVersion : UInt64 = 1
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        let dbPath = docPath.appending("/swiftProjectDB.realm")
        
        let config = Realm.Configuration(fileURL: URL.init(string: dbPath), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: dbVersion, migrationBlock: { (migration, oldSchemaVersion) in
            
        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
        Realm.Configuration.defaultConfiguration = config
        Realm.asyncOpen { (result) in
            print(result)
            
//            if let _ = realm {
//                print("Realm 服务器配置成功!")
//            }else if let error = error {
//                print("Realm 数据库配置失败：\(error.localizedDescription)")
//            }
        }
    
     }
}
extension DataTool {
    
   class func insert<T>(data : T) where T  : Object{
        let realm = try! Realm()
        try! realm.write {
       
            realm.add(data)
        }
    }
    class func getAll<T>()->[T] where T : Object {
        var list = [T]()
         let realm = try! Realm()
        let lists = realm.objects(T.self)
       
        for m in lists {
            list.append(m)
        }
        return list.reversed()
    }
    
    
}
