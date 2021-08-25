//
//  Helper.swift
//  HSTabSlidePage
//
//  Created by wanglei on 2021/8/23.
//

import Foundation
import SwiftUI
import UIKit

let width_yhc = UIScreen.main.bounds.width
let height_yhc = UIScreen.main.bounds.height

@available(iOS 13.0, *)
class Manager: ObservableObject {
    //Slide Control
    @Published var isLeft: Bool = true
    @Published var slidePercent: CGFloat = 0
    @Published var toRight: Bool = true
    
    //TabItem
    @Published var leftImg: String? = nil
    @Published var leftSelectedImg: String? = nil
    @Published var leftTitle: String = "主页"
    @Published var rightImg: String? = nil
    @Published var rightSelectedImg: String? = nil
    @Published var rightTitle: String = "副页"
    
    //Configure
    @Published var bgColorHex: Int = 0xffffff
    @Published var sliderColorHex: Int = 0x00a1ff
    
    init(leftImg: String? = nil,
         leftSelectedImg: String? = nil,
         leftTitle: String = "主页",
         rightImg: String? = nil,
         rightSelectedImg: String? = nil,
         rightTitle: String = "副页",
         bgColorHex: Int = 0xffffff,
         sliderColorHex: Int = 0x00a1ff) {
        self.leftImg = leftImg
        self.leftSelectedImg = leftSelectedImg
        self.leftTitle = leftTitle
        self.rightImg = rightImg
        self.rightSelectedImg = rightSelectedImg
        self.rightTitle = rightTitle
    }
}

@available(iOS 13.0, *)
extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
