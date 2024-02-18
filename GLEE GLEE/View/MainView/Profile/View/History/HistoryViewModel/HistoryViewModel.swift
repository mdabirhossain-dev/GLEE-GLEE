//
//  HistoryViewModel.swift
//  GLEE GLEE
//
//  Created by Tanvir Rahman on 26/12/23.
//

import Foundation

class HistoryViewModel: ObservableObject {
    
    let dataManager = CoreDataManager.shared
    
    @Published var historyDate: [HistoryDate] = []
    
    init(){
        self.historyDate = self.fetchHistory()
    }
    
    private func fetchHistory() -> [HistoryDate]{
        let data = dataManager.fetch(HistoryDate.self)
        
        return data.reversed()
    }
    private func deleteHistoryDate(entity: HistoryDate) {
        dataManager.delete(entity)
        
    }

    private func deleteHistoryByDate(history: History){
        dataManager.delete(history)
    }
}
