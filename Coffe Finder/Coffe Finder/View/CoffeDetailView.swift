//
//  CoffeDetailView.swift
//  Coffe Finder
//
//  Created by Sultan Rifaldy on 20/11/22.
//

import SwiftUI

struct CoffeDetailView: View {
    //Properties
    let coffeDetail : Coffeeshop
    
    
    //body
    var body: some View {
        ZStack{
            LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(spacing: 0){
                Image("\(coffeDetail.image)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200)
                    .clipShape(Circle())
                    .scaledToFit()
                    .overlay{
                        ZStack{
                            Circle()
                                .opacity(0.8)
                            VStack{
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .renderingMode(.original)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 40))
                                
                                Text("\(coffeDetail.name)")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }
                            //VStack
                        }
                        //ZStack
                    }
                    .padding(.bottom, -60)
                ;Text("\(coffeDetail.review)")
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .fontWeight(.medium)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 60)
                    .padding(.bottom, 30)
                HStack {
                    Image(systemName: "pin.circle.fill")
                        .foregroundColor(.white)
                    Text("\(coffeDetail.location)")
                        .fontWeight(.light)
                    .foregroundColor(.white)
                }
                Spacer()
                //Overlay
            }
            //VStack
        }
        //ZStack
    }
}

struct CoffeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeDetailView(coffeDetail: Coffeeshop(image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class", isFavorite: false))
    }
}
