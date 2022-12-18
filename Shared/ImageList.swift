//
//  ImageList.swift
//  TechImage (iOS)
//
//  Created by 勝田啓一 on 2022/12/11.
//

import SwiftUI

struct ImageList: View {
    
    // EnvironmentObjectはビューからビューに伝搬される
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        
        List {
            ForEach (self.userData.images) { item in
                ImageListView(id: item.id)
            }
        }
        .navigationBarTitle(Text("画像リスト"))
    }
}

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        ImageList().environmentObject(UserData())
    }
}
