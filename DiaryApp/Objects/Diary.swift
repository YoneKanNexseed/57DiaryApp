//
//  Diary.swift
//  DiaryApp
//
//  Created by yonekan on 2019/11/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import RealmSwift

// 日記の設計図
class Diary: Object {
    
    // ID
    @objc dynamic var id: Int = 0
    
    // タイトル
    @objc dynamic var title: String = ""
    
    // 本文
    @objc dynamic var body: String = ""
    
    // 作成日
    @objc dynamic var createdAt: Date = Date()
    
}
