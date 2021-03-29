//
//  ContentView.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct ContentView: View {
    @StateObject var profiledate = ProfileDetailViewModel()
    @Namespace var animation
    @State var gotohome = false
    var body: some View {
       
      

        NavigationView{
            ZStack{
                if gotohome{
                    Home(animation: animation)
                        .navigationBarHidden(true)
                        .environmentObject(profiledate)

                }
                else{

                    DragLogin()
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("home")), perform: { _ in
                withAnimation{

                    self.gotohome = true
                }
            })
        }
        .navigationBarHidden(true)
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DragLogin : View {
    @State var maxHeight = UIScreen.main.bounds.width - 100
    @State var offset  :CGFloat = 0
    var body: some View{
        
        
        ZStack{
            
            Color.purple
                .ignoresSafeArea(.all, edges: .all)
            
            
            VStack{
                
                Spacer(minLength: 0)
                
                Text("SMART Screen")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Rainbow is Beautiful")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom)
                
                
                
                
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    
                
                Spacer(minLength: 0)
                
                ZStack{
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                    
                    Text("Swipe to Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .kerning(1.5)
                        .padding(.leading,30)
                    
                    HStack{
                        
                        
                        Capsule()
                            .fill(Color.red)
                            .frame(width: caluculatewidth() + 68)
                        
                        Spacer(minLength: 0)
                    }
                    
                    HStack{
                        
                        
                        
                        
                        ZStack{
                            
                            Image(systemName: "chevron.right")
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                            
                        }
                        .foregroundColor(.white)
                        .offset(x: 5)
                        .frame(width: 65, height: 65)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnded(value:)))
                        
                        
                        Spacer()
                    }
                    
                    
                    
                    
                }
                .frame(width: maxHeight, height: 65)
                .padding(.bottom)
                   
            }
        }
    }
    
    func caluculatewidth()->CGFloat{
        
        let progress = offset / maxHeight
        
        return progress * maxHeight
    }
    
    
    
    func onChange(value:DragGesture.Value){
        
        
        if value.translation.width > 0 && offset <= maxHeight - 68{
            
            offset = value.translation.width
            
        }
        
        
    
        
        
        
        
    }
    
    func onEnded(value:DragGesture.Value){
        
        withAnimation{
            if offset > 180{
                
                offset = maxHeight - 68
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    
                    NotificationCenter.default.post(name: NSNotification.Name("home"), object: nil)
                    
                    
                    
                }
            }
            else{
                
                offset = 0
            }
        }
        
        
    }
}
