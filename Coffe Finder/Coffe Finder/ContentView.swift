//
//  ContentView.swift
//  Coffe Finder
//
//  Created by Sultan Rifaldy on 18/11/22.
//

import SwiftUI

struct ContentView: View {
    //Properties
    @State private var selectedTab: Tabs = .Coffeshop
    
    
    //Body
    var body: some View {
        NavigationStack{
            TabView (selection: $selectedTab){
                CoffeListView()
                    .listStyle(.plain)
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                    .tag(Tabs.Coffeshop)
                
                Text("Watch".uppercased())
                    .font(.system(.largeTitle, design: .rounded))
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Watch")
                    }
                    .tag(Tabs.watch)
                
                Text("Loans".uppercased())
                    .font(.system(.largeTitle, design: .rounded))
                    .tabItem {
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                        Text("Loans")
                    }
                    .tag(Tabs.loans)
                
                Text("Profile".uppercased())
                    .font(.system(.largeTitle, design: .rounded))
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tabs.profile)
            }//TabView
            .tint(.indigo)
            .navigationTitle(selectedTab.rawValue.capitalized)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tabs: String {
    case Coffeshop
    case watch
    case loans
    case profile
}
