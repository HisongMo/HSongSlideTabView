//
//  BView.swift
//  SliderTabVIewDemo
//
//  Created by wanglei on 2021/8/24.
//

import SwiftUI

struct BView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.init(hex: 0x00A1FF))
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.init(hex: 0xFF9900))
                    .frame(width: 400 * 0.618, height: 400, alignment: .center)
                    .shadow(radius: 8)
                Text("World hello!")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BView_Previews: PreviewProvider {
    static var previews: some View {
        BView()
    }
}
