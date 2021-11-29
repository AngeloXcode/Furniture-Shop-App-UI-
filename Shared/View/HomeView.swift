//
//  HomeView.swift
//  HomeApp
//
//  Created by Angelo Essam on 28/11/2021.
//

import SwiftUI

struct HomeView : View {
    let icons = ["house","heart.fill","cart.fill.badge.plus","person.crop.circle","location.fill"]
    @State private var selectedIndex : Int = 0
    private let catagories = ["All","Chairs","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        NavigationView{
            ZStack{
                Color("BGColor")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading){
                        NavigationUIView()
                        TagLineView()
                            .padding()
                        SearchView().padding()
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(0 ..< catagories.count) { item in
                                    CategoryItemView(isActive: item == self.selectedIndex,text:catagories[item]).onTapGesture {
                                        self.selectedIndex = item
                                    }
                                }
                            }
                        }// End of ScrollView
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding()
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(0..<5){ item in
                                    NavigationLink(destination:DetialsView()
                                                   ,label: {
                                        LuxuryItemView(name: "\(item+1)")
                                            .padding(.trailing)
                                    }).navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                            }
                        }.padding(.leading)
                        
                        Text("Best Paid")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding()
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(0..<5){ item in
                                    NavigationLink(destination:DetialsView()
                                                   ,label: {
                                        LuxuryItemView(name: "\(item+1)")
                                            .padding(.trailing)
                                    }).navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    
                                    
                                    
                                }
                            }
                        }.padding(.leading)
                        
                    }
                } // End of Main ScrollView
                
                HStack{
                    ForEach(0 ..< icons.count) { item in
                        TabVarItemView(name: "\(icons[item])"){
                            
                        }
                    }
                }.padding()
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .shadow(color: .gray.opacity(0.15), radius: 8, x: 2, y: 5)
                    .frame(maxHeight:.infinity,alignment:.bottom)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.black)
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Black", size: 29))
            .foregroundColor(Color.black)
            .fontWeight(.bold)
    }
}

struct SearchView: View {
    @State private var search : String = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                    .padding(.trailing,8)
                TextField("Search Furniture ",text:$search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal)
            Spacer()
            Image(systemName: "barcode.viewfinder")
                .frame(width: 50.0, height:50.0 )
                .font(.custom("PlayfairDisplay-Black", size: 10))
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(10.0)
        }
    }
}

struct CategoryItemView: View {
    let isActive : Bool
    let text : String
    var body : some View {
        VStack(alignment:.leading,spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.black.opacity(0.8) :  Color.gray )
            if isActive {
                Capsule()
                    .background(Color.gray)
                    .frame(width: 15, height:2)
            }
        }.padding()
    }
}

struct LuxuryItemView: View {
    var name : String
    var body: some View {
        ZStack{
            Color.white.cornerRadius(20)
            VStack{
                Image(name)
                    .resizable()
                    .frame(width: 200.0, height: 210.0)
                    .cornerRadius(10)
                
                Text("Luxury Swedian Chair")
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack{
                    ForEach(0..<5){ item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                    Text("$1299")
                        .fontWeight(.bold)
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                    
                }
                
            }.padding()
        }.frame(width: 200.0)
            .padding()
    }
}

struct TabVarItemView: View {
    let name : String
    let action : ()->Void
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: name)
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        })
    }
}
