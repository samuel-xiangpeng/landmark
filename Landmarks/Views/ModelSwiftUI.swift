//
//  ModelSwiftUI.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/26.
//

import SwiftUI

internal struct Test {
    private var name: String
    var age: Int
}

struct ModelSwiftUI: View {
    var body: some View {
        Text("Hello World")
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            .background(.red)
            .ignoresSafeArea()
    }
}

#Preview {
    ModelSwiftUI()
}
