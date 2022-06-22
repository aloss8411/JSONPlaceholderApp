//
//  ContentView.swift
//  InstagramApp
//
//  Created by Lan Ran on 2022/6/20.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var userName = UserModel()
    @State private var user:String = ""
    @State private var isValueChanged = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 50){
                if user != ""{
                    Text("你的名字是" + user + "嗎？")
                        .foregroundColor(.orange)
                }
            Text("告訴我你的名字")
                .padding()
                .frame(height: 30)
                .foregroundColor(.black)
                .cornerRadius(20)
                .font(.system(size: 28))
                TextField("我該如何稱呼你？",text:$user){
                    (status) in
                    if status{
                        //點擊開始
                    }
                }onCommit: {
                    //完成編輯，把資料傳遞過去ViewModel內
                        userName.userName = user
                }
                
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.black)
                
            NavigationLink("開始紀錄", destination: {
                        PersonalDetailView()
            })
            .frame(width: 200, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(.yellow)
            .cornerRadius(20)
            Spacer()
            
                
            }
            .padding(.top,100)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("搜尋帳號")          
        }
        .environmentObject(userName)
    }
}
class user:ObservableObject{
    
    @Published var userName:String
    init(userName:String){
        self.userName = userName
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(UserModel())
    }
}



