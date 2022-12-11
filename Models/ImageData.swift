//
//  ImageData.swift
//  TechImage (iOS)
//
//  Created by 勝田啓一 on 2022/12/11.
//

import Foundation

struct ImageInfo: Identifiable {
    
    let id :Int
    let name: String
    var path: String
    var isFavorite: Bool
    
    
}

let imageInfos: [ImageInfo] = loadImageInfos()

func loadImageInfos() -> Array<ImageInfo> {
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask,
                                                            true)[0]
    
    guard var fileNames = try? FileManager.default.contentsOfDirectory(atPath: documentsPath) else {
        return []
    }
    
    // ファイル名称を昇順で並べ替え
    fileNames.sort { $0 < $1 }
    
    // お気に入りの情報を取得する
    let favoriteArray: Array<String> = []
    
    // 画像情報の構造体に設定する
    var imageInfos: Array<ImageInfo> = []
    
    // 全てのファイル情報を配列に設定する
    var idNum = 0
    for name: String in fileNames {
        
        // お気に入りか判定
        var isFavorite = false
        if favoriteArray.contains(name) == true {
            isFavorite = true
        }
        
        // Documentsフォルダパスにファイル名称を追加してファイルパスを作成
        let path = documentsPath + "/" + name
        
        // 構造体を作成
        let imageInfo = ImageInfo(id: idNum,
                                  name: name,
                                  path: path,
                                  isFavorite: isFavorite)
        
        // 配列に追加
        imageInfos.append(imageInfo)
        
        // ファイルごとに異なるidを割り振るために1ずつ増やす
        idNum += 1
    }
    
    return imageInfos
    
}
