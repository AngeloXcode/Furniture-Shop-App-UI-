//
//  NavigationView.swift
//  HomeApp
//
//  Created by Angelo Essam on 28/11/2021.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HStack{
            Button(action:{}){
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.gray)
                    .cornerRadius(10.0)
                    .padding()
                
            }.frame(width: 50.0, height: 50.0)
            Spacer()
            Button(action:{}){
                Image("profile")
                    .resizable()
                    .background(Color.white)
                    .cornerRadius(10.0)

            }.frame(width: 40.0, height: 40.0)
        }.padding()
            
    
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
