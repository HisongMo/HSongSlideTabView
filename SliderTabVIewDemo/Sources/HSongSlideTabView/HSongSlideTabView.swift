//
//  demo11.swift
//  AnimationDemo
//
//  Created by wanglei on 2021/8/21.
//

import SwiftUI

@available(iOS 13.0, *)
public struct HSongSlideTabView<Pages>: View where Pages: View {
    
    @ObservedObject var manager: Manager
    
    @State private var view_x: CGFloat = width_yhc / 2.0
    @State private var view_y: CGFloat = height_yhc / 2.0
    
    public let pages: PageContainer<Pages>
    
    public init(manager: Manager, @PageViewBuilder builder: () -> PageContainer<Pages>) {
        self.manager = manager
        pages = builder()
    }
    
    public var body: some View {
        ZStack {
            
            HStack {
                pages
                    .frame(width: width_yhc, height: height_yhc)
            }
            .position(CGPoint(x: manager.toRight ? width_yhc * manager.slidePercent : width_yhc + width_yhc * manager.slidePercent, y: view_y))

            Slider(manager: manager, bgWidth: width_yhc - 30, bgHeight: 60)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}
