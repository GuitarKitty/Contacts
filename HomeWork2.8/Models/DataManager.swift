//
//  DataManager.swift
//  HomeWork2.8
//
//  Created by Alexey Mironov on 20.02.2021.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    var names = [
        "Вася", "Артур", "Владимир", "Владимир", "Данила"
    ]
    
    var surnames = [
        "Рогов", "Пирожков", "Путин", "Жириновский", "Бодров"
    ]
    
    var emails = [
        "vasya@mail.ru", "pirog@mail.ru", "mr.presidentmail.ru",
        "zhirik@mail.ru", "brother@mail.ru"
    ]
    
    var phones = [
        "+79111231212", "79111231212", "1", "+79111231213",
        "+79111231131"
    ]
    
    private init() {}
}
