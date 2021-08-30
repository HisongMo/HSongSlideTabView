//
//  SwiftUIView.swift
//  
//
//  Created by wanglei on 2021/8/23.
//

import SwiftUI


@available(iOS 13.0, *)
public struct HSTabItem: View {
        
    @Environment(\.colorScheme) var colorScheme
    
    @State var leftImg: Bool = true
    public var img: String?
    public var title: String
    
    public var body: some View {
            
            if leftImg {
                HStack {
                    if img != nil {
                        Image(img!)
                    }
                    Text(title)
                        .foregroundColor(Color.init(hex: colorScheme == .light ? 0x000000 : 0xffffff))
                }
            }
    }
}
