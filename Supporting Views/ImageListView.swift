//
//  ImageListView.swift
//  TechImage (iOS)
//
//  Created by 勝田啓一 on 2022/12/18.
//

import SwiftUI

// 画像リストの行
struct ImageListView: View {
    
    @EnvironmentObject private var userData: UserData
    
    // self.userData.images配列の番号
    let id: Int
    
    var body: some View {
        
        // ビューを横に並べて表示
        HStack {
            
            // 画像情報が1つでも存在する場合
            if self.userData.images.count > 0 {
                
                // UIImage.init(contentOfFile:)にファイルパスを設定すると画像が取得できる
                // !は強制的アンラップ
                Image(uiImage: UIImage.init(contentsOfFile: self.userData.images[self.id].path)!)
                    .resizable()
                    
                    // 画像の縦横比を維持したままリサイズする
                    .aspectRatio(contentMode: .fit)
                
                    // 縦横サイズと表示位置を設定している
                    .frame(width: 50, height: 50, alignment: .center)
                
                // ファイル名称
                Text(self.userData.images[self.id].name)
                
                // 画面一杯まで余白を追加
                Spacer()
                
                // お気に入りの場合
                if self.userData.images[self.id].isFavorite {
                    
                    // 色付きのハート
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.pink)
                } else {
                    // 色なしのハート
                    Image(systemName: "heart")
                        .foregroundColor(Color.gray)
                }
            }
            else {
                // 画像情報がない場合、Noneを表示
                Text("None")
            }
        }
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView(id: 0).environmentObject(UserData())
    }
}
