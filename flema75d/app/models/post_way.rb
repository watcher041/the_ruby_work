class PostWay < ActiveHash::Base
        self.data = [
        {id: 1, name: "未定"},{id: 2, name: "らくらくフリマ便"},{id: 3, name: "ゆうゆうフリマ便"},
        {id: 4, name: "ゆうメール"},{id: 5, name: "レターパック"},{id: 6, name: "普通郵便(定形、定形外)"},
        {id: 7, name: "クロネコヤマト"},{id: 8, name: "ゆうパック"},{id: 9, name: "クリックポスト"},
        {id: 10, name: "ゆうパケット"}
    ]
end
