//
//  BookPersistenceStore.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation
import CoreData

class BookPersistenceStore {
    static let shared = BookPersistenceStore()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BookPersistenceStore")
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
    
    private lazy var context = persistentContainer.newBackgroundContext()
    
    private init() {
    }
    
    func fetchBooks(completion: @escaping (Result<[BookEntity], Error>) -> Void) {
        context.perform {
            do {
                let books = try self.context.fetch(BookEntity.fetchRequest())
                DispatchQueue.main.async {
                    completion(.success(books))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func setBookFavorite(uuid: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        context.perform {
            do {
                let request = BookEntity.fetchRequest()
                let predicate = NSPredicate(format: "uuid == %d", uuid)
                request.predicate = predicate
                let book = try self.context.fetch(request).first
                
                if let book {
                    book.isFavorite = isFavorite
                    try self.context.save()
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(BookPersistenceStoreError.bookNotFound))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func merge(with remoteBooks: [Book], completion: @escaping (Result<(), Error>) -> Void) {
        context.perform {
            do {
                let books = try self.context.fetch(BookEntity.fetchRequest())
                
                for remoteBook in remoteBooks {
                    if let index = books.firstIndex(where: { $0.uuid == remoteBook.uuid }) {
                        books[index].update(with: remoteBook)
                    } else {
                        let book = BookEntity(context: self.context)
                        book.update(with: remoteBook)
                    }
                }
                try self.context.save()
                DispatchQueue.main.async {
                    completion(.success(()))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
}

enum BookPersistenceStoreError: Error {
    case bookNotFound
}
