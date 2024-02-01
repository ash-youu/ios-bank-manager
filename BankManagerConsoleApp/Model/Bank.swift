//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

import Foundation

struct Bank {
    var bankManager: BankManager = BankManager()
    
    mutating func addClient(_ client: Client) {
        bankManager.addClientQueue(client)
    }
    
    mutating func publishTicketNumber() -> Int {
        return bankManager.publishTicketNumber()
    }
    
    mutating func openSystem() {
        self.bankManager.open()
        self.bankManager.resetWorkData()
    }
    
    mutating func resetWorkData() {
        self.bankManager.resetWorkData()
    }
}
