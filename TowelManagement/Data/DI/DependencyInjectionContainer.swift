//
//  DependencyInjectionContainer.swift
//  TowelManagement
//
//  Created by mac on 01/07/2024.
//

import Foundation
class DependencyInjectionContainer {
    static let shared = DependencyInjectionContainer()

    private static var services: [String: Any] = [:]

    static func register<T>(_ service: T) {
        services[String(describing: T.self)] = service
    }

    static func resolve<T>() -> T {
        guard let t = services[String(describing: T.self)] as? T else {
            fatalError("No provider registered for type \(T.self)")
        }
        return t
    }
}


@propertyWrapper
struct Inject<T> {
    var wrappedValue: T
   // private let container: DependencyInjectionContainer.resolve()

    init() {
        self.wrappedValue = DependencyInjectionContainer.resolve()
        print("Inject <- \(self.wrappedValue)")
    }

   
}
@propertyWrapper
struct Provider<T> {
    var wrappedValue: T
  
    init(wrappedValue : T) {
        self.wrappedValue = wrappedValue
        DependencyInjectionContainer.register(wrappedValue)
        print("Inject -> \(self.wrappedValue) ")
    }
}
