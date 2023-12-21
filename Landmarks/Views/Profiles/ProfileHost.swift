//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2024/1/18.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    
    // 草稿数据用于中转存储到环境中
    @State private var draftProfile: Profile = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(){
                        draftProfile = modelData.profile
                    }
                    .onDisappear(){
                        modelData.profile = draftProfile
                    }
            }
        }
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
