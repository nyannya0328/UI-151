//
//  profile.swift
//  UI-151
//
//  Created by にゃんにゃん丸 on 2021/03/29.
//

import SwiftUI

struct profile: Identifiable {
    var id = UUID().uuidString
    var username : String
    var profile : String
    var lastmsg : String
    var time : String
}

let recents = [

profile(username: "Snow Man", profile: "p1", lastmsg: "The most in time is now", time: "10:00"),
    profile(username: "Rainbow", profile: "p2", lastmsg: "Hi Raibow", time: "12:00"),
    profile(username: "Gao🦁", profile: "p3", lastmsg: "Today is a gift", time: "13:00"),
    profile(username: "Girl", profile: "p4", lastmsg: "Living in the moment", time: "23:00"),
    profile(username: "Rabit", profile: "p5", lastmsg: "Do you have it?", time: "3:00"),
    profile(username: "Ema", profile: "p6", lastmsg: "Without hestation", time: "17:00"),
]
