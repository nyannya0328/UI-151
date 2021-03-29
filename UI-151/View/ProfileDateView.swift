//
//  ProfileDateView.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct ProfileDateView: View {
    @EnvironmentObject var profiledate : ProfileDetailViewModel
    @GestureState var offset : CGFloat = 0
    var animation : Namespace.ID
    var body: some View {
        ZStack(alignment:.top){
            if profiledate.selectedProfile != nil{
                
                
                if profiledate.showEnlargedImage{
                    
                    Image(profiledate.selectedProfile.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: profiledate.selectedProfile.id, in: animation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .offset(y: profiledate.offset)
                        .gesture(DragGesture().updating($offset, body: { (value, out, _) in
                            out = value.translation.height
                        }).onEnded({ (value) in
                            
                            let offset = profiledate.offset > 0 ? profiledate.offset : -profiledate.offset
                            
                            withAnimation{
                                
                                if offset > 200{
                                    
                                    profiledate.showProfile.toggle()
                                    profiledate.showEnlargedImage.toggle()
                                    profiledate.selectedProfile = nil
                                    
                                }
                                profiledate.offset = 0
                            }
                            
                        }))
                        .background(Color.green.opacity(getOpactiy()).ignoresSafeArea())
                    
                    HStack{
                        
                        
                        Button(action: {
                            profiledate.showProfile.toggle()
                            profiledate.showEnlargedImage.toggle()
                            profiledate.selectedProfile = nil
                            
                     
                        }, label: {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                            
                                .foregroundColor(.white)
                        })
                        
                        
                        Text(profiledate.selectedProfile.username)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "TEXT\(profiledate.selectedProfile.id)", in: animation)
                        
                        Spacer(minLength: 0)
                    }
                    .padding()
                    
                }
                
                else{
                    
                    Button(action: {
                        
                        
                        withAnimation(.easeOut){
                            
                            
                            profiledate.showEnlargedImage.toggle()
                        }
                        
                    }, label: {
                        Image(profiledate.selectedProfile.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(TitleView(recent: profiledate.selectedProfile, animation: animation),alignment: .top)
                    })
                        .overlay(ButtonAcctions(),alignment: .bottom)
                        .matchedGeometryEffect(id: profiledate.selectedProfile.id, in: animation)
                        .frame(width: 300, height: 300)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green.opacity(0.3)
                                        .ignoresSafeArea()
                                        .onTapGesture {
                                            withAnimation{
                                                
                                                profiledate.showProfile.toggle()
                                                profiledate.selectedProfile = nil
                                            }
                                        }
                        
                        
                        )
                    
                    
                }
                
                
                
                
            }
            
            
            
        }
        .onChange(of: offset, perform: { value in
            profiledate.offset = offset
        })
    }
    
    func getOpactiy()->Double{
        
        let offset = profiledate.offset > 0 ? profiledate.offset : -profiledate.offset
        
        let progress = offset / 180
        
        return 1 - Double(progress)
    }
}

struct TitleView : View {
    var recent : profile
    var animation : Namespace.ID
    var body: some View{
        
        Text(recent.username)
        
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,alignment: .leading)
            .matchedGeometryEffect(id: "TEXT\(recent.id)", in: animation)
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.green.opacity(0.2))
        
        
    }
}

struct ProfileDateView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonAcctions : View {
    var body: some View{
        
        HStack{
            
            NavigationLink(destination: ChipsView()) {
                
                Image(systemName: "message.fill")
                    .font(.title2)
                    .foregroundColor(.green)
                
            }
            
           
               
            
            Spacer(minLength: 0)
            
            NavigationLink(destination: TabWall()) {
               
                    Image(systemName: "info.circle.fill")
                        .font(.title2)
                        .foregroundColor(.pink)
            
                
            }
            
            
          
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
        
        
    }
}
