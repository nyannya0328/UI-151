//
//  ChipsView.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct ChipsView: View {
    var body: some View {
        NavigationView{
            
            Chips()
                .navigationTitle("Chips View")
                
        }
        
    }
}

struct ChipsView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsView()
    }
}

struct Chips : View {
    @State var txt = ""
    
    @State var chips :[[chipdate]] = [
    
   
    
    ]
    var body: some View{
        
        VStack(spacing:35){
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(alignment:.leading){
                   
                    
                    
                    ForEach(chips.indices,id:\.self){index in
                        
                        HStack{
                      
                           
                            
                            
                            ForEach(chips[index].indices,id:\.self){chipIndex in
                                
                                Text(chips[index][chipIndex].chiptext)
                                
                                    .fontWeight(.semibold)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    
                                    .background(
                                    
                                    Capsule()
                                        .stroke(Color.primary)
                                    )
                                    .lineLimit(1)
                                    .overlay(
                                        GeometryReader{reader -> Color in
                                            
                                            
                                            let maxX = reader.frame(in: .global).maxX
                                            
                                            if maxX > getrect().width - 70 && !chips[index][chipIndex].isExeed{
                                                
                                                DispatchQueue.main.async {
                                                    chips[index][chipIndex].isExeed = true
                                                    let lastitem = chips[index][chipIndex]
                                                    chips.append([lastitem])
                                                    chips[index].remove(at:chipIndex)
                                                }
                                                
                                            }
                                            
                                            return Color.clear
                                        }
                                        ,alignment: .trailing
                                    
                                    )
                                    .clipShape(Capsule())
                                    .onTapGesture {
                                        chips[index].remove(at:chipIndex)
                                        if chips[index].isEmpty{
                                            
                                            chips.remove(at: index)
                                        }
                                    }
                                    
                                    
                            
                                
                                    
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                .padding()
               
                
            }
            .frame(width: getrect().width - 30, height: getrect().height / 3)
            .background(
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.primary.opacity(0.5),lineWidth: 3)
            )
             
            TextEditor(text: $txt)
                .padding()
                
               
                
                .frame(height: 150)
                .background(
                
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.primary.opacity(0.5),lineWidth: 3)
                )
            
            Button(action: {
                
                if chips.isEmpty{
                    
                    chips.append([])
                }
              
                    
                    chips[chips.count - 1].append(chipdate(chiptext: txt))
                    txt = ""
                    
             
            }) {
                
                Text("Add tag")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(8)
                    
                
            }
            .disabled(txt == "")
            .opacity(txt == "" ? 0.5 : 1)
            
                
            
        }
        .padding()
    }
}


struct chipdate : Identifiable {
    var id = UUID().uuidString
    var chiptext : String
    var isExeed = false
}

extension View{
    
    func getrect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
