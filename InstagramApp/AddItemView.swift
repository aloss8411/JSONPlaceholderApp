//
//  AddItemView.swift
//  JSONPlaceholderApp
//
//  Created by Lan Ran on 2022/6/22.
//

import SwiftUI

struct AddItemView: View {
    
    @State var id:Int = 0
    @State var title:String = ""
    @State var completed:Bool = false
    
    var body: some View {
        VStack{
            Text("TEST")
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
