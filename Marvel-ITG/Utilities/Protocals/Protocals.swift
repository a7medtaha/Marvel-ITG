//
//  Protocals.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation

protocol PhotoView:class {
    func setPhoto(with Url: String)
}
protocol DataView:class {
    func setData<T>(_ dt:T)
}


protocol LoaderDelegate:class {
    func loader_start()
    func loader_stop()
    func onFailure<T>(_ msg: T)
    func onSuccess<T>(_ msg: T)
    func onEmpty()
    func onConnection()
}
