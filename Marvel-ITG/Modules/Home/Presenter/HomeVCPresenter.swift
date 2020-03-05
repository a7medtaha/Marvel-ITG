//
//  HomeVCPresenter.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation
protocol HomeVCView: LoaderDelegate {
    func didSelectItem<T>(with data: T)
}
class HomeVCPresenter {
    private let interactor = HomeVCInteractor()
    private var list = [Results]()
    weak var view: HomeVCView?
    init(view:HomeVCView) {
        self.view = view
    }
    
    func get_list(offest:Int)  {
        view?.loader_start()
        interactor.get_charactors(offeset: offest, didDataReady: { [weak self](model) in
            guard self != nil else { return }
            if model.code == API_status.Success.rawValue{
                self?.list = model.data?.results ?? []
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
        cell.setData(item.name ?? "")
        let image_url = (item.thumbnail?.path ?? "") + "." + (item.thumbnail?.exten ?? "")
//        print("#image_url ==> ",image_url)
        cell.setPhoto(with: image_url)
 
       
    }

    
    func get_list_count() -> Int {
        return list.count
    }
  func didselect(at row: Int)  {
    let item = list[row]
    view?.didSelectItem(with: item)
  
   }

}
