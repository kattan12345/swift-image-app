//
//  Album.swift
//  TechImage (iOS)
//
//  Created by 勝田啓一 on 2022/12/03.
//

import SwiftUI

struct Album: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Text("全ての項目")
                Text("お気に入り")
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
