//
//  game.swift
//  FindNumber
//
//  Created by Irina Zorina on 09.09.2022.
//

import Foundation

enum StatusGame{
    case start
    case win
}

struct Item {
    
    var title:String
    var isFound:Bool = false
}

class Game {
    
    private let data = Array(1...99)
    
    var items:[Item] = []
    
    private var countItems:Int
    
    var nextItem:Item?
    
    var status:StatusGame = .start
    
    init(countItems:Int) {
        self.countItems = countItems
        setupGame()
    }
    
    private func setupGame() {
        var digit = data.shuffled()
        
        while items.count < countItems{
            let item = Item(title: String(digit.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first
    }
    
    func check(index:Int) {
        if items[index].title == nextItem?.title{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in item.isFound == false
            })
            
        }
        
        if nextItem == nil{
            status = .win
        }
    }
}
