//
//  SwiftUIView.swift
//  
//
//  Created by wanglei on 2021/8/23.
//

import SwiftUI

@available(iOS 13.0, *)
public struct Slider: View {
    
    @ObservedObject var manager: Manager
    
    var bgWidth: CGFloat = width_yhc - 30
    var bgHeight: CGFloat = 50
    let bgWidth_1_4: CGFloat = (width_yhc - 30) / 4.0
    let bgWidth_3_4: CGFloat = (width_yhc - 30) / 4.0 * 3
    let bgPosition: CGPoint = CGPoint(x: width_yhc / 2.0, y: height_yhc - 60)
    var bg_y: CGFloat { bgHeight / 2.0 }
    
    @State private var ctrlPoint_x = (width_yhc - 30) / 4.0
    @State private var slideTitle: String = "左边"
    
    @State private var isTap: Bool = false
//    @State private var isLeft: Bool = true
    
    private var menuDrag: some Gesture {
        DragGesture(minimumDistance: 1.0, coordinateSpace: .local)
            .onChanged { value in
                isTap = false
                var tap_offset: CGFloat = 0
                if value.startLocation.x < width_yhc / 2.0 {
                    tap_offset = bgWidth_1_4 - value.startLocation.x
                } else {
                    tap_offset = bgWidth_3_4 - value.startLocation.x
                }
                
                ctrlPoint_x = value.location.x + tap_offset
                
                if ctrlPoint_x < bgWidth_1_4 {
                    ctrlPoint_x = bgWidth_1_4
                }
                if ctrlPoint_x > bgWidth_3_4 {
                    ctrlPoint_x = bgWidth_3_4
                }
                
                //percent
                let distance_x = calculate_distance_x(p1: value.startLocation, p2: value.location)
                
                //judge slide direction
                if distance_x > 0 && value.startLocation.x < width_yhc / 2.0 {
                    manager.toRight = true
                } else if distance_x <= 0 && value.startLocation.x > width_yhc / 2.0 {
                    manager.toRight = false
                }
                
                if (manager.toRight && value.startLocation.x <= width_yhc / 2.0) || (!manager.toRight && value.startLocation.x > width_yhc / 2.0) {
                    manager.slidePercent = distance_x / (bgWidth / 2.0)
                }
            }
            .onEnded { value in
                var tap_offset: CGFloat = 0
                if value.startLocation.x < width_yhc / 2.0 {
                    tap_offset = bgWidth_1_4 - value.startLocation.x
                } else {
                    tap_offset = bgWidth_3_4 - value.startLocation.x
                }
                
                withAnimation(.easeInOut(duration: 0.2)) {
                    //向右滑动
                    if value.location.x + tap_offset >= width_yhc / 2.0{
                        ctrlPoint_x = bgWidth_3_4
                        slideTitle = "右边"
                        manager.isLeft = false
                        if manager.toRight {
                            manager.slidePercent = 1
                        } else {
                            manager.slidePercent = 0
                        }
                    } else { //向左
                        ctrlPoint_x = bgWidth_1_4
                        slideTitle = "左边"
                        manager.isLeft = true
                        if manager.toRight {
                            manager.slidePercent = 0
                        } else {
                            manager.slidePercent = -1
                        }
                    }
                    
                    //预判
                    if value.predictedEndLocation.x + tap_offset >= width_yhc / 2.0{
                        ctrlPoint_x = bgWidth_3_4
                        slideTitle = "右边"
                        manager.isLeft = false

                        if manager.toRight {
                            manager.slidePercent = 1
                        } else {
                            manager.slidePercent = 0
                        }
                    } else { //向左
                        ctrlPoint_x = bgWidth_1_4
                        slideTitle = "左边"
                        manager.isLeft = true
                        if manager.toRight {
                            manager.slidePercent = 0
                        } else {
                            manager.slidePercent = -1
                        }
                    }
                }
            }
    }
    
    public var body: some View {
        GeometryReader { geo in
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.init(hex: manager.bgColorHex))
                .frame(width: bgWidth, height: bgHeight)
                .shadow(radius: 8)
            
            
            if manager.leftImg != nil {
                HSTabItem(img: manager.leftImg, title: manager.leftTitle)
                    .position(CGPoint(x: bgWidth_1_4, y: bg_y))
                    .onTapGesture {
                        isTap = true
                        withAnimation(.easeInOut(duration: 0.2)) {
                            manager.isLeft = true
                            manager.toRight = false
                            manager.slidePercent = -1
                        }
                    }
                HSTabItem(img: manager.rightImg, title: manager.rightTitle)
                    .foregroundColor(.black)
                    .position(CGPoint(x: bgWidth_3_4, y: bg_y))
                    .onTapGesture {
                        isTap = true
                        withAnimation(.easeInOut(duration: 0.2)) {
                            manager.isLeft = false
                            manager.toRight = true
                            manager.slidePercent = 1
                        }
                    }
            } else {
                HSTabItem(title: manager.leftTitle)
                    .position(CGPoint(x: bgWidth_1_4, y: bg_y))
                    .onTapGesture {
                        isTap = true
                        withAnimation(.easeInOut(duration: 0.2)) {
                            manager.isLeft = true
                            manager.toRight = false
                            manager.slidePercent = -1
                        }
                    }
                HSTabItem(title: manager.rightTitle)
                    .foregroundColor(.black)
                    .position(CGPoint(x: bgWidth_3_4, y: bg_y))
                    .onTapGesture {
                        isTap = true
                        withAnimation(.easeInOut(duration: 0.2)) {
                            manager.isLeft = false
                            manager.toRight = true
                            manager.slidePercent = 1
                        }
                    }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.init(hex: manager.sliderColorHex))
                    .frame(width: bgWidth / 2.0 - 20, height: bgHeight - 15)

                if manager.isLeft {
                    HSTabItem(img: manager.leftSelectedImg, title: manager.leftTitle)
                } else {
                    HSTabItem(img: manager.rightSelectedImg, title: manager.rightTitle)
                }
            }
            .position(CGPoint(x: isTap ? (manager.isLeft ? bgWidth_1_4 : bgWidth_3_4) : ctrlPoint_x, y: bg_y))
            .gesture(menuDrag)
        }
        .frame(width: bgWidth, height: bgHeight)
        .position(bgPosition)
        .edgesIgnoringSafeArea(.all)
    }
}

public func calculate_distance_x(p1: CGPoint, p2: CGPoint) -> CGFloat {
    p2.x - p1.x
}
