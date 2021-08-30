//
//  AView.swift
//  SliderTabVIewDemo
//
//  Created by wanglei on 2021/8/24.
//

import SwiftUI

struct AView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.init(hex: 0x6CE6E5))
                    .frame(width: 400 * 0.618, height: 400, alignment: .center)
                    .shadow(radius: 8)
                Text("Hello, World!")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AView_Previews: PreviewProvider {
    static var previews: some View {
        AView()
    }
}
