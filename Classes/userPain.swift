//
//  UserPain.swift
//  IMoniQ
//
//  Created by Ding on 18/5/18.
//  Copyright © 2018 Hyojin Lee. All rights reserved.
//

import Foundation

struct userPain: Codable {
    
    var painLevel: Float = 0
    var date: Date = Date()
    
    func getUserPainHistory()
    {
        let defaults = UserDefaults.standard
        if let savedPain = defaults.object(forKey: "pain") as? Data {
            let decoder = JSONDecoder()
            if let loadedPain = try? decoder.decode(Array<userPain>.self, from: savedPain) {
                userPainHistory = loadedPain
            }
        }
    }
    
    func updateUserPainHistory(currentPain: Float)
    {
        let defaults = UserDefaults.standard
        let currentDate = Date()
        let pain = userPain(painLevel: currentPain, date: currentDate)
        getUserPainHistory()
        userPainHistory.append(pain)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(userPainHistory) {
            defaults.set(encoded, forKey: "pain")
        }
    }
    
    func deleteUserPainHistory()
    {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "pain")
        userPainHistory = Array()
    }
    
    
}

var userPainHistory: Array<userPain> = Array()
