//
//  CoreDataRepository.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/10.
//

import ObjectiveC
import UIKit
import CoreData

class CoreDataRepository: NSObject {
    
    static let shared = CoreDataRepository()
    
    override init() {
        super.init()
    }
    
    /// 日付情報の追加
    func saveTimeCalcEntity() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        do {
            try appDelegate.persistentContainer.viewContext.save()
        } catch {
            Logger.log("addTimeCalcEntity \(error.localizedDescription)")
        }
    }
    
    /// 日付情報の取得
    func getTimeCalcEntity() -> [TimeCalcEntity] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let savedFetchEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "TimeCalcEntity")
        do {
            guard let convertedResult = try appDelegate.persistentContainer.viewContext.fetch(savedFetchEntity) as? [TimeCalcEntity] else {
                return []
            }
            return convertedResult
        } catch {
            Logger.log("getTimeCalcEntity \(error.localizedDescription)")
            return []
        }
    }
}
