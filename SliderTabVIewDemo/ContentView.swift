//
//  ContentView.swift
//  SliderTabVIewDemo
//
//  Created by wanglei on 2021/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var bgColorHex: Int {
        colorScheme == .light ? 0xFF9900 : 0x6CE6E5
    }

    var manager: Manager {
        Manager(leftImg_light: "mima-light", leftImg_dark: "mima-dark", leftSelectedImg_light: "mima-light-sed", leftSelectedImg_dark: "mima-dark-sed", leftTitle: "密码", rightImg_light: "wupin-light", rightImg_dark: "wupin-dark", rightSelectedImg_light: "wupin-light-sed", rightSelectedImg_dark: "wupin-dark-sed", rightTitle: "记物")
    }
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
