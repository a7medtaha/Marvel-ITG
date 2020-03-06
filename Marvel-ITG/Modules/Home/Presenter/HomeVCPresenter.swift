//
//  HomeVCPresenter.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation
import RealmSwift
protocol HomeVCView: LoaderDelegate {
    func didSelectItem<T>(with data: T)
    func reloadWithCach()
   func presentSearchVC<T>(with data: T)
}
class HomeVCPresenter {
    private let realm = try! Realm()
    private var no_connection = false
    private var cached: Bool {
        get {
            return UserDefaults.standard.object(forKey: "cached") as? Bool ?? false
        } set {
            UserDefaults.standard.set(newValue, forKey: "cached")
            UserDefaults.standard.synchronize()
        }
    }
    private let interactor = HomeVCInteractor()
    private var list = [Results]()
    private var list_cached = [ResultsCached]()
    weak var view: HomeVCView?
    init(view:HomeVCView) {
        self.view = view
        print("#realm = ",Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    func get_list(offest:Int)  {
        view?.loader_start()
        interactor.get_charactors(offeset: offest, didDataReady: { [weak self](model) in
            guard self != nil else { return }
            self!.no_connection = false
            if model.code == API_status.Success.rawValue{
                self?.list += model.data?.results ?? []
                if self!.list.count == 0{
                    self?.view?.onEmpty()
                }else{
                    if  !(self!.cached){
                        self!.preparedForCaching()
                    }
                    self!.view?.onSuccess("")
                }
            }else{
                self?.view?.onFailure("")
            }
            self?.view?.loader_stop()
        }) { [weak self](error) in
            guard self != nil else { return }
            self!.no_connection = true
            self?.view?.loader_stop()
            if self!.cached{
                self?.list_cached = self!.getObjects()
                self!.view?.reloadWithCach()
            }else{
                self?.view?.onConnection()
            }
        }
    }
    
    
    func configureCell(cell: CharacterCellView,at row: Int)  {
        if no_connection{
            let item =  list_cached[row]
            cell.setData(item.name )
            let image_url = (item.thumbnail?.path ?? "") + "/\(xlarge)." + (item.thumbnail?.exten ?? "")
            cell.setPhoto(with: image_url)
        }else{
            let item =  list[row]
            cell.setData(item.name ?? "")
            let image_url = (item.thumbnail?.path ?? "") + "/\(xlarge)." + (item.thumbnail?.exten ?? "")
            cell.setPhoto(with: image_url)
        }
        
        
        
    }
    private func getObjects()->[ResultsCached] {
        let realmResults = realm.objects(ResultsCached.self)
        print("realmResults",realmResults)
        return Array(realmResults)
        
    }
    private func getObjects<T:Object>(filter:String)->[T] {
        let realmResults = realm.objects(T.self).filter(filter)
        return Array(realmResults)
        
    }
    
    private  func preparedForCaching()  {
        cached = true
        var resultArray : [ResultsCached] = []
        for result in list {
            let res = ResultsCached()
            res.desc = result.description ?? ""
            res.id = result.id ?? 0
            res.name = result.name ?? ""
            res.modified = result.modified ?? ""
            res.resourceURI = result.resourceURI ?? ""
            res.resourceURI = result.resourceURI ?? ""
            res.comics = setObject(result.comics!)
            res.stories = setObject(result.stories!)
            res.series = setObject(result.series!)
            res.events = setObject(result.events!)
            let th = ThumbnailCached()
            th.path = (result.thumbnail?.path) ??  ""
            th.path = result.thumbnail?.exten ?? ""
            res.thumbnail =  th
            resultArray.append(res)
        }
        save(objects: resultArray)
    }
    
    private func setObject(_ obj: Stories) -> StoriesCached{
        let comics = StoriesCached()
        comics.available = obj.available ?? 0
        comics.collectionURI = obj.collectionURI ?? ""
        comics.returned = obj.returned ?? 0
        comics.items = getItems(items: obj.items ?? [])
        return comics
    }
    private func getItems(items:[Items]) -> List<ItemsCached>{
        let arr = List<ItemsCached>()
        for item in  items{
            let itemX = ItemsCached()
            itemX.name = item.name ?? ""
            itemX.resourceURI = item.resourceURI ?? ""
            arr.append(itemX)
        }
        return arr
    }
    private  func save<T:Object>(objects: [T]){
        do{
            try realm.write {
                realm.add(objects)
            }
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    
    
    func get_list_count() -> Int {
        return  no_connection ? list_cached.count : list.count
    }
    func didselect(at row: Int)  {
        if no_connection{
            let item = list_cached[row]
            view?.didSelectItem(with: item)
        }else{
            let item = list[row]
            view?.didSelectItem(with: item)
        }
        
        
    }
    
    
    func search()  {
        if no_connection {
            view?.presentSearchVC(with: list_cached)

        }else{
            view?.presentSearchVC(with: list)

        }
    }
    
}
