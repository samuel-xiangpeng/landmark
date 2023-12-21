//
//  PageView.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2024/1/19.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            //图片轮播控制
            PageViewController(currentPage: $currentPage, pages: pages)
            //底部圆点切换控制
            PageController(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        //纵横比
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
