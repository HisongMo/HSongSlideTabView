//
//  SwiftUIView.swift
//  
//
//  Created by wanglei on 2021/8/23.
//
import SwiftUI

/// Container for composite pages
@available(iOS 13.0, *)
public struct PageContainer<Content>: View where Content: View {
    
    let count: Int
    let content: Content
    
    public var body: some View {
        content
    }
    
}

@resultBuilder
public struct PageViewBuilder {
    
    @available(iOS 13.0, *)
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> PageContainer<TupleView<(C0, C1)>> where C0 : View, C1 : View {
        let compositeView = ViewBuilder.buildBlock(c0, c1)
        return PageContainer(count: 2, content: compositeView)
    }
}

