//
//  InputViewController.swift
//  DiaryApp
//
//  Created by yonekan on 2019/11/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // ボタンがクリックされたとき
    @IBAction func didClickButton(_ sender: UIButton) {
        
        // タイトルが空かチェック
        if isNullOrEmpty(text: textField.text) {
            // textField.textがnil または 空の場合
            return // 処理を中断
        }
        
        // 本文が空かチェック
        if isNullOrEmpty(text: textView.text) {
            // textView.textがnil または 空の場合
            return
        }
        
    }
    
    // nil または 空文字をチェックするメソッド
    // nil または 空文字ならtrue, それ以外ならfalseを返す
    func isNullOrEmpty(text: String?) -> Bool  {
        
        if text == nil || text == "" {
            // 引数textがnil または 空文字の場合
            return true
        }
        
        return false
    }
    
    // 新しい日記をRealmに保存するメソッド
    func createNewDiary(title: String, body: String) {
        
        // Realmに接続
        let realm = try! Realm()
        
        // 新規日記作成
        let diary = Diary()
        
        // 日記の項目をうめる
        diary.title = title
        diary.body = body
        diary.createdAt = Date()
        diary.id = getMaxId()
        
        // Realmに書き込む
        try! realm.write {
            realm.add(diary)
        }
    }
    
    // 最大の日記IDを取得して、返すメソッド
    func getMaxId() -> Int {
        // Realmに接続
        let realm = try! Realm()
        
        // 現在あるIDの最大 + 1 を計算
        let id = (realm.objects(Diary.self).max(ofProperty: "id") as Int? ?? 0) + 1
        
        return id
    }
    
}
