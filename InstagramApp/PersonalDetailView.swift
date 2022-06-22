//
//  PersonalDetailView.swift
//  InstagramApp
//
//  Created by Lan Ran on 2022/6/21.
//

import SwiftUI
struct PersonalDetailView: View {
   
    @State var searchText = ""
    @StateObject var Model = toDoList()
    @EnvironmentObject var userId:UserModel
    @State var isPressed = false

    var body: some View {
        List{
            ForEach(Model.toDoListItem.indices,id: \.self){
                index in
                VStack(alignment: .leading, spacing: 10){
                    Text(Model.toDoListItem[index].title)
                        .font(.system(size: 20) .weight(.heavy))
                        .padding(.leading,0)
                    Text("第 " + "\(Model.toDoListItem[index].id)" + "項任務")
                        .font(.system(size: 12) .weight(.heavy))
                        }
                .padding()
                }
            .onDelete { index in
                guard let indexSet = index.first else{return}
                Model.deleteItem(id: indexSet)
                }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("To do List Item")
        .progressViewStyle(CircularProgressViewStyle())
        .onAppear(perform: Model.fetch)
        .searchable(text: $searchText,prompt: "搜尋待辦事項")
        .onChange(of: searchText){searchTexts in
            if !searchTexts.isEmpty{
                let result = Model.toDoListItem.filter{$0.title.contains(searchTexts)}
                Model.toDoListItem = result
            }else{
                Model.fetch()
            }
        }
    }
}
struct PersonalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailView()
            .environmentObject(UserModel())
    }
}


