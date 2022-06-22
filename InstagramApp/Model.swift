//
//  ViewModel.swift
//  InstagramApp
//
//  Created by Lan Ran on 2022/6/21.
//

import Foundation
import SwiftUI

class UserModel:ObservableObject{
    
    @Published var userName = ""
}
class toDoList:ObservableObject{
    
   @Published var toDoListItem:[toDoListItems] = []
    let Encode = JSONEncoder()
    let decode = JSONDecoder()
    func fetch(){
        let url = URL(string:"https://jsonplaceholder.typicode.com/users/1/todos")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {[weak self]data, response, error in
            if let data = data {
                do{
                    let datas = try self!.decode.decode([toDoListItems].self,from:data)
                    DispatchQueue.main.async {
                        self?.toDoListItem = datas
                    }
                }
                catch{
                    print(error)
                }
            }
        }.resume()
    }
    func deleteItem(id:Int){
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(id)")
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request).resume()
    }
    func patchItem(id:Int,title:String,Comleted:Bool){
        var model:toDoListItems?
        model?.userId = 1
        model?.id = id
        model?.title = title
        model?.completed = Comleted
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(id)")
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        request.httpBody = try? Encode.encode(model)
        URLSession.shared.dataTask(with: request).resume()
    }
    func createItem(id:Int,title:String,Comleted:Bool){
        var model:toDoListItems?
        model?.userId = 1
        model?.id = id
        model?.title = title
        model?.completed = Comleted
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        request.httpBody = try? Encode.encode(model)
        URLSession.shared.dataTask(with: request).resume()
    }
}
struct toDoListItems:Codable{
    var id:Int
    var title:String
    var userId:Int
    var completed:Bool
}
