//
//  SwiftUIView.swift
//  
//
//  Created by wanglei on 2021/8/23.
//

import SwiftUI


@available(iOS 13.0, *)
struct HSTabItem: View {
        
    @State var leftImg: Bool = true
    var img: String?
    var title: String
    
    var body: some View {
            
            if leftImg {
                HStack {
                    if img != nil {
                        Image(img!)
                    }
                    Text(title)
                }
            }
    }
}
