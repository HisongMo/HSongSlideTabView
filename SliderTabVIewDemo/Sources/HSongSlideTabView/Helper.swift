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
public class Manager: ObservableObject {
    //Slide Control
    @Published var isLeft: Bool = true
    @Published var slidePercent: CGFloat = 0
    @Published var toRight: Bool = true
    
    //TabItem
    @Published var leftImg_light: String? = nil
    @Published var leftImg_dark: String? = nil
    @Published var leftSelectedImg_light: String? = nil
    @Published var leftSelectedImg_dark: String? = nil
    @Published var leftTitle: String = "主页"
    @Published var rightImg_light: String? = nil
    @Published var rightImg_dark: String? = nil
    @Published var rightSelectedImg_light: String? = nil
    @Published var rightSelectedImg_dark: String? = nil
    @Published var rightTitle: String = "副页"
    
    //Configure
    @Published var bgColorHex: Int? = 0xffffff
    @Published var sliderColorHex: Int? = 0x00a1ff
    
    /// 图片推荐尺寸@1x 25 @2x 50 @3x 75
    public init(leftImg_light: String? = nil,
                leftImg_dark: String? = nil,
                leftSelectedImg_light: String? = nil,
                leftSelectedImg_dark: String? = nil,
                leftTitle: String = "主页",
                rightImg_light: String? = nil,
                rightImg_dark: String? = nil,
                rightSelectedImg_light: String? = nil,
                rightSelectedImg_dark: String? = nil,
                rightTitle: String = "副页",
                bgColorHex: Int? = nil,
                sliderColorHex: Int? = nil) {
        self.leftImg_light = leftImg_light
        self.leftImg_dark = leftImg_dark
        self.leftSelectedImg_light = leftSelectedImg_light
        self.leftSelectedImg_dark = leftSelectedImg_dark
        self.leftTitle = leftTitle
        self.rightImg_light = rightImg_light
        self.rightImg_dark = rightImg_dark
        self.rightSelectedImg_light = rightSelectedImg_light
        self.rightSelectedImg_dark = rightSelectedImg_dark
        self.rightTitle = rightTitle
        self.bgColorHex = bgColorHex
        self.sliderColorHex = sliderColorHex
    }
}

@available(iOS 13.0, *)
extension Color {
    public init(hex: Int, alpha: Double = 1) {
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
