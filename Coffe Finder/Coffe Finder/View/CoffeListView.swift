//
//  CoffeListView.swift
//  Coffe Finder
//
//  Created by Sultan Rifaldy on 20/11/22.
//

import SwiftUI
import ActivityView

struct CoffeListView: View {
    //Properties
    @State var results = CoffeeshopProvider.all()
    
//    private var coffeSearchResult : [Coffeeshop] {
//
//        if searchBar.isEmpty {
//            return results
//        } else {
//            return results.filter{ index in
//                index.name.lowercased().contains(searchBar.lowercased()) || index.name.contains(searchBar)
//            }
//        }
//    }
//
//    private var suggestedResult: [Coffeeshop] {
//        if searchBar.isEmpty {
//            return []
//        } else {
//            return coffeSearchResult
//        }
//    }
//    @State private var searchBar : String = ""
    
    //Body
    var body: some View {
        NavigationStack{
            List{
                ForEach(results) { result in
                    ZStack (alignment: .leading){
                        NavigationLink(destination: CoffeDetailView(coffeDetail: result)) {
                            EmptyView()
                        }
                        .opacity(0)
                        CoffeShopList(result: result)
                    }//ZSTACK
                }//ForEach
                .onDelete{indexSet in
                    results.remove(atOffsets: indexSet)
                }
                .listRowSeparator(.hidden)
            
            }//List
            .listStyle(.plain)
            .navigationTitle("Coffeshop")
//            .searchable(text: $searchBar,
//                        placement: .navigationBarDrawer(displayMode: .always),
//                        prompt: "Search Coffeshops"
//            ) {
//                ForEach(suggestedResult) { result in
//                    Text("Looking for \(result.name)?")
//                        .searchCompletion(result.name)
//                }
//            }
        }//NavigationStack
    }
}


struct CoffeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeListView()
    }
}

struct CoffeShopList: View {
    @State var result: Coffeeshop
    @State private var item: ActivityItem?
    @State private var showAlert: Bool = false
    var body: some View {
        HStack{
            Image("\(result.image)")
                .resizable()
                .frame(width: 125, height: 125)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack (alignment: .leading){
                Text("\(result.name)")
                    .padding(.bottom, 5)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                Text("\(result.location)")
                    .padding(.bottom, 5)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                if result.isFavorite{
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
            }//VStack
        }//HStack
        .swipeActions (edge: .leading, allowsFullSwipe: false){
            Button {
                
            }
            label: {
                Image(systemName: "heart")
            }
            Button {
                
            }
            label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.blue)
        }
        .contextMenu{
            Button {
                showAlert = true
            }
            label: {
                HStack{
                    Text("Pin This Location")
                    Image(systemName:"pin")
                }//HSTACK
            }
            
            Button {
                result.isFavorite.toggle()
            }
            label: {
                HStack{
                    Text(result.isFavorite ? "Remove From Favorite": "Mark as Favorite")
                    Image(systemName: result.isFavorite ? "heart.slash" : "heart")
                }//HSTACK
            }
            Button {
                item = ActivityItem(items: "\(result.name) Location Will Be Shared!")
            } label: {
                HStack{
                    Text("Share Article")
                    Image(systemName: "square.and.arrow.up")
                }//HStack
            }
        }//ContextMenu
        .activitySheet($item)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Current Location Not Available"),
                message: Text("Your current location can’t be " +
                              "determined at this time.")
            )
        }
    }
}
