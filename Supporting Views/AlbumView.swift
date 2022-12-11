//
//  AlbumView.swift
//  TechImage (iOS)
//
//  Created by 勝田啓一 on 2022/12/03.
//

import SwiftUI

struct AlbumView: View {
    
    let name: String
    let path: String
    let isFavorite: Bool
    
    init(name: String, path: String, isFavorite: Bool) {
        self.name = name
        self.path = path
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        
        // ビューを重ねて表示
        ZStack {
            
            // ビューをグループ化
            Group {
                
                // 画像のファイルパスが設定されている場合
                if self.path.count > 0 {
                    Image(uiImage: UIImage.init(contentsOfFile: self.path)!)
                        .renderingMode(.original)
                        .frame(width: 100, height: 100, alignment: .center)
                }
                else {
                    Image(systemName: "square.on.square")
                        .renderingMode(.original)
                        .frame(width: 100, height: 100, alignment: .center)
                }
                
                // お気に入りの場合
                if self.isFavorite {
                    Image(systemName: "heart.fill")
                        .frame(width: 100, height: 100, alignment: .bottomLeading)
                        .foregroundColor(.pink)
                }
            }
            .padding()
            .border(Color.gray, width: 1)
        }
        .cornerRadius(10)
        
        Text(self.name)
            .foregroundColor(.primary)
        
        Group {
            if self.isFavorite {
                Text("0")
            }
            else {
                Text("0")
            }
        }
        .foregroundColor(.primary)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(name: "お気に入り", path: "", isFavorite: true)
    }
}
