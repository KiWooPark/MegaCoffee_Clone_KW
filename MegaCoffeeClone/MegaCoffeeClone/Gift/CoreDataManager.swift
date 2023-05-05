//
//  CoreDataManager.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/24.
//
// 이 코드는 비동기적으로 동작하지 않는다.
// context.perform을 통한 비동기적으로 구현도 가능하다.



import Foundation
import CoreData
import UIKit

final class CoreDataManager {
    
    // (1) 싱글톤 만들기
    static let shared = CoreDataManager()
    private init() {}
    
    
    // (2) 앱 델리게이트로 타입캐스팅을 해서, 언제든지 편하게 앱 델리게이트에 접근하기 위해
    // AppDelegate: 앱이 실행될 때 그 하나의 앱을 관리하는 객체
    // 왜 만들엇어? : 앱 델리게이트에 container와 savecontext가 선언되어 있어서 그것을 가져오려고.
    lazy var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // (3) 임시 저장소에 접근할 수 있도록 상수 선언.
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // (4) 엔터티 이름 생성 (코어데이터에 저장된 객체)
    let modelName: String = "Item"
    
    // (4) Coredat를 받아올 배열 생성
    var itemArray = [Item]()
    
    // MARK: -- [1] [Read] 코어데이터에 저장된 데이터를 '모두' 읽어오기.
    func loadItem() {
        
            let request: NSFetchRequest<Item> = Item.fetchRequest()
           
            do {
             
                itemArray = try context.fetch(request)
                
            } catch {
                print("error saving context - \(error)")
            }

    }



    // MARK: -- [2] [Create] 코어데이터에 데이터 저장.
    func saveItem() {
        //CoreData에 저장
        do {
            print(context)
            
            try context.save()
            
        } catch {
            print("error saving context - \(error)")
        }
        
    }

    
    // MARK: -- [3] DeleteAll
    
    func deleteAllData(_ entity:String) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
            
        } catch let error {
            print("error deleting all data in \(entity) :", error)
        }
    }
    
    
    
    
    
    
    
    

    
    // MARK: -- End
}
