//
//  Album.swift
//  TechImage (iOS)
//
//  Created by 勝田啓一 on 2022/12/03.
//

import SwiftUI

struct Album: View {
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                NavigationLink(destination: ImageList()) {
                    AlbumView(name: "全ての項目",
                              path: self.userData.images.count > 0 ? self.userData.images[0].path : "",
                              isFavorite: false)
                }
                
                NavigationLink(destination: ImageList()) {
                    AlbumView(name: "お気に入り",
                              path: self.userData.images.count > 1 ? self.userData.images[0].path : "",
                              isFavorite: true)
                }
            }
            
            .navigationBarTitle(Text("アルバム"))
        }
    }
}

struct Album_Previews: PreviewProvider {
    static var previews: some View {
        Album()
    }
}
