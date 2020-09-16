//
//  ContentView.swift
//  testAlefDevelopment
//
//  Created by Кирилл Коновалов on 16.09.2020.
//  Copyright © 2020 Кирилл Коновалов. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var patronymic = ""
    @State private var age = ""
    @State var childrenArray: [Children] = []
    
    var body: some View {
        NavigationView() {
            VStack() {
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Введите ваше имя", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(5)
                    .padding(.top, 5)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Введите вашу фамилию", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(5)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Введите вашe отвество", text: $patronymic)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(5)
                        
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Введите ваш возраст", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(5)
                    .padding(.bottom, 5)
                }
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 10)
                
                VStack {
                    if childrenArray.count <= 4 {
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(Color.red)
                                .frame(width: 20, height: 20)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(100)
                        .shadow(radius: 5)
                        .onTapGesture {
                            self.childrenArray.append(Children(name: "", age: ""))
                        }
                    }
                    
                    Text("Дети")
                }
                .padding(.top, 10)
                
                List {
                    ForEach(childrenArray.indices, id: \.self) { i in
                        ChildrenView(model: Binding(
                          get: {
                            return self.childrenArray[i]
                        },
                        set: { (newValue) in
                            self.childrenArray[i] = newValue
                        }))
                    }.onDelete(perform: self.deleteItem)
                }
            }
            .padding(.top, 10)
            .navigationBarTitle("Вы и Дети")
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
            })
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.childrenArray.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
