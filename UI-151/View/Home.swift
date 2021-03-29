//
//  Home.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var profiledate : ProfileDetailViewModel
    var animation : Namespace.ID
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment:.leading){
                
                Text("Whats UP")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                    .padding(.vertical)
                
                
                ForEach(recents){recent in
                    
                    RecentRowView(recent: recent, animation: animation)
                    
                    
                    
                }
                
                

                
            }
        })
        
        .overlay(
        
            ZStack(alignment:.top){
                
                if profiledate.showProfile{
                    
                    
                    ProfileDateView(animation: animation)
                }
            }
        )
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
