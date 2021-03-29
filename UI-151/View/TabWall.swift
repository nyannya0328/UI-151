//
//  TabWall.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct TabWall: View {
    @State var selected : Int = 1
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        TabView(selection: $selected){
            
            
            ForEach(1...6,id:\.self){index in
                
                ZStack(alignment:.bottomTrailing){
                    
                    GeometryReader{reader in
                        
                        Image("p\(index)")
                            .resizable()
                            .frame(width: getrect().width, height: getrect().height / 2)
                            .offset(x : -reader.frame(in: .global).minX)
                           
                        
                        
                    }
                    .frame(height: getrect().height / 2)
                    .cornerRadius(8)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: -5)
                    
                    Image("p\(selected)")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: -5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -35, y: -25)
                    
                        
                }
                .padding(.horizontal,25)
                
                
               
            }
            
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
       
    }
}

struct TabWall_Previews: PreviewProvider {
    static var previews: some View {
        TabWall()
    }
}
