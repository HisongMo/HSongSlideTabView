//
//  ContentView.swift
//  SliderTabVIewDemo
//
//  Created by wanglei on 2021/8/24.
//

import SwiftUI

struct ContentView: View {
    let manager: Manager = Manager(leftTitle: "你好", rightTitle: "欢迎")
    var body: some View {
        HSongSlideTabView(manager: manager) {
            AView()
            BView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
