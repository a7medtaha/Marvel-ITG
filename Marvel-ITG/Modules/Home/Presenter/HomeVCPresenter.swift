//
//  HomeVCPresenter.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//
protocol LoaderDelegate:class {
    func loader_start()
    func loader_stop()
    func onFailure<T>(_ msg: T)
    func onSuccess<T>(_ msg: T)
    func onEmpty()
    func onConnection()
}
import Foundation
class HomeVCPresenter {
    private let interactor = HomeVCInteractor()
    private var list = [Character]()
    weak var view: LoaderDelegate?
    init(view:LoaderDelegate) {
        self.view = view
    }
    
    func get_list(offest:Int)  {
        view?.loader_start()
        interactor.get_charactors(offeset: offest, didDataReady: { [weak self](model) in
            guard self != nil else { return }
            if model.responseCode == API_status.Success.rawValue{
                self?.list = model.apiDataSource?.characters ?? []
                if self!.list.count == 0{
                    self?.view?.onEmpty()
                }else{
                    self!.view?.onSuccess("")
                }
            }else{
                self?.view?.onFailure("")
            }
            self?.view?.loader_stop()
        }) { [weak self](error) in
            guard self != nil else { return }
            self?.view?.loader_stop()
            self?.view?.onConnection()
        }
    }


    func configureCell(cell: CharacterCellView,at row: Int)  {
        let item = list[row]
        cell.setName(name: item.name ?? "")
        let image_url = (item.thumbnail?.path ?? "") + "." + (item.thumbnail?.fileExtension ?? "")
        print("#image_url ==> ",image_url)
        cell.setPhoto(with: image_url)
 
       
    }

    
    func get_list_count() -> Int {
        return list.count
    }
  func didselect(at row: Int)  {
    let item = list[row].id ?? 0
  
   }

}
