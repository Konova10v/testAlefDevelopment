//
//  ChildrenView.swift
//  testAlefDevelopment
//
//  Created by Кирилл Коновалов on 16.09.2020.
//  Copyright © 2020 Кирилл Коновалов. All rights reserved.
//

import SwiftUI

struct Children {
    var name: String
    var age: String
}

struct ChildrenView: View {
    @Binding var model: Children
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("Введите имя ребенка", text: $model.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(5)
            .padding(.top, 5)
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("Введите возраст ребенка", text: $model.age)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(5)
            .padding(.bottom, 5)
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        .padding(.horizontal, 10)
    }
}

struct ChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenView(model: .constant(Children(name: "", age: "")))
    }
}
