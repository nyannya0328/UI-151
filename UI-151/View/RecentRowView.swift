//
//  RecentRowView.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct RecentRowView: View {
    var recent : profile
    @EnvironmentObject var profiledate : ProfileDetailViewModel
    var animation : Namespace.ID
    var body: some View {
        HStack{
            
            Button(action: {
                withAnimation{
                    profiledate.selectedProfile = recent
                    profiledate.showProfile.toggle()
                   
                    
                    
                }
                
                
            }, label: {
                ZStack{
                    
                    
                    Image(recent.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    
                    if !profiledate.showProfile{
                        
                        Image(recent.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                           .matchedGeometryEffect(id: recent.id, in: animation)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                }
                
            })
            .buttonStyle(PlainButtonStyle())
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text(recent.username)
                                .fontWeight(.bold)
                            
                                .kerning(1.3)
                            
                            Text(recent.lastmsg)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        })
                        
                        Spacer(minLength: 0)
                        
                        
                        Text(recent.time)
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    Divider()
                }
           
        }
        .padding(.horizontal)
    }
}

struct RecentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
