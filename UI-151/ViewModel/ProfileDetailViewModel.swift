//
//  ProfileDetailViewModel.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

class ProfileDetailViewModel: ObservableObject {
    
    @Published var showProfile = false
    @Published var selectedProfile : profile!
   
    @Published var showEnlargedImage = false
    @Published var offset : CGFloat = 0
    
}

