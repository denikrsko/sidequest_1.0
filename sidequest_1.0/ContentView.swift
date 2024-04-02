//
//  ContentView.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 03/01/2024.
//

import SwiftUI

struct StyleMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func style() -> some View{
        modifier(StyleMod())
    }
}

struct ContentView: View {
    @State private var showingToDo_view = false
    
    var body: some View {
        NavigationStack{
            Spacer()
            SwiftUI.GeometryReader { proxy in
                VStack(alignment:.leading) {
                    HStack{ 
                        NavigationLink(destination: To_Do_view()) {
                            Text("to-do")}
                                .frame(width: proxy.size.width * 0.49, height: proxy.size.height * 0.25)
                                .background(Color.purple)
                                .style()
                        NavigationLink(destination: Shopping_view()) {
                            Text("shopping")}
                            .frame(width: proxy.size.width * 0.49, height: proxy.size.height * 0.25)
                            .background(Color.yellow)
                            .style()
                        }
                    NavigationLink(destination: Uni_view()) {
                    Text("uni")}
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.23)
                        .background(Color.mint)
                        .style()
                    Button("fishes"){
                            
                    }
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.23)
                        .border(Color.blue, width: 5)
                        .style()
                    HStack {
                        NavigationLink(destination: Grateful_view()) {
                        Text("i am grateful for...")}
                        .frame(width: proxy.size.width * 0.49, height: proxy.size.height * 0.25)
                        .background(Color.orange)
                        .style()
                        NavigationLink(destination: Priority_view()) {
                        Text("priority of a day")}
                        .frame(width: proxy.size.width * 0.49, height: proxy.size.height * 0.25)
                        .background(Color.indigo)
                        .style()
                    }
                    }
                }
            }
            .padding(10)
        }
    }
    
    #Preview {
        ContentView()
    }

