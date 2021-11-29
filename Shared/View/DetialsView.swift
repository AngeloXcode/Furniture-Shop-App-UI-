//
//  DetialsView.swift
//  HomeApp
//
//  Created by Angelo Essam on 29/11/2021.
//

import SwiftUI


struct DetialsView : View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body : some View{
        VStack{
            ZStack{
                Color("BGColor")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        Image("2")
                            .resizable()
                            .aspectRatio(contentMode : .fit)
                         
                        
                        DescriptionView().offset(y:-40)
                        Spacer()
                    }
                }.edgesIgnoringSafeArea(.top)
                
                HStack{
                    Text("$1920")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button(action:{
                        
                    },label:{
                        Text("Add to Cart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(.gray)
                    })
                    
                }.padding()
                    .padding(.horizontal)
                    .background(Color.gray)
                    .cornerRadius(50, corners: .topLeft)
                    .frame(maxHeight:.infinity,alignment: .bottom)
                
                
                
            }.edgesIgnoringSafeArea(.bottom)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                                           .padding(.all,12)
                                           .foregroundColor(.gray)
                                           .background(Color.white)
                                           .cornerRadius(8.0)
                })
                                        ,trailing: Image(systemName: "square.and.arrow.up")
                                        .padding(.all,12)
                                        .foregroundColor(.gray)
                                        .background(Color.white)
                                        .cornerRadius(8.0))
        }
    }
}




struct DescriptionView: View {
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Luruxy Swedia \n Chair")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom,4)
            
            HStack(spacing:4){
                ForEach(0..<5){ item in
                    Image(systemName: "star")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                }
                Text("4.9")
                    .opacity(0.5)
                    .padding(.leading,8)
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pretium nec eros sit amet elementum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam molestie velit nec urna placerat tincidunt. Etiam rhoncus, nibh vel elementum mollis, quam tortor tempor massa, at varius quam arcu at mi. Duis condimentum lectus a euismod aliquam. Donec euismod ac erat pretium varius. Duis risus diam, hendrerit ut massa ac, facilisis rhoncus tellus. Quisque eu volutpat felis. Ut elementum, quam eget pulvinar molestie, dui tellus dignissim nisl, sed interdum ante est ac lacus. Sed nisi leo, cursus quis sapien sed, tempus tristique enim. In hac habitasse platea dictumst. Aliquam aliquam urna ac nisl vestibulum vestibulum. Pellentesque tristique, eros sed rhoncus consequat, dolor odio efficitur nibh, eget consectetur felis nulla vitae enim.")
                .lineLimit(4)
                .multilineTextAlignment(.leading)
                .opacity(0.9)
            
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    Text("size")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Height : 120 cm")
                        .opacity(0.6)
                    Text("Width : 140 cm")
                        .opacity(0.6)
                    Text("Diameter : 73 cm")
                        .opacity(0.6)
                    
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                VStack(alignment:.leading){
                    Text("Treatement")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("wood curve")
                        .opacity(0.6)
                    Text("Width : 140 cm")
                        .opacity(0.6)
                    Text("Diameter : 73 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                
            } .padding(.vertical)
            VStack(alignment:.leading){
                Text("Quantity")
                    .fontWeight(.semibold)
                HStack{
                    VStack(alignment:.leading){
                        Text("Color")
                            .fontWeight(.semibold)
                        HStack{
                            ColorDotView(color:.white)
                            ColorDotView(color:.black)
                            ColorDotView(color:Color("BGColor"))
                        }
                    }           .foregroundColor(.black)
                    
                    Spacer()
                    Button(action:{}){
                        Image(systemName: "minus")
                            .padding(.all,8)
                    }.frame(width:30,height:30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                    
                    Text("1")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal,8)
                    
                    Button(action:{}){
                        Image(systemName: "plus")
                            .padding(.all,8)
                    }.frame(width:30,height:30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                    
                }
            }
            
        }// End of VStack
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(40.0)
        
    }
}


struct ColorDotView : View {
    var color : Color
    var body : some View{
        color.frame(width:24,height: 24).clipShape(Circle())
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
