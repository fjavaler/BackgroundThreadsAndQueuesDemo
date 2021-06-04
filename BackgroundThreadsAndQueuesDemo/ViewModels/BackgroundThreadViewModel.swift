//
//  BackgroundThreadViewModel.swift
//  BackgroundThreadsAndQueuesDemo
//
//  Created by Fred Javalera on 6/3/21.
//

import Foundation

class BackgroundThreadViewModel: ObservableObject {
  
  // MARK: Properties
  @Published var dataArray: [String] = []
  
  func fetchData() {
    
    DispatchQueue.global(qos: .background).async {
      
      let newData = self.downloadData()
      
      print("Check 1: \(Thread.isMainThread)")
      print("Check 1: \(Thread.current)")
      
      DispatchQueue.main.async {
        self.dataArray = newData
        print("Check 2: \(Thread.isMainThread)")
        print("Check 2: \(Thread.current)")
      }
      
    }
    
  }
  
  private func downloadData() -> [String] {
    
    // Mock download of data.
    var data: [String] = []
    
    for x in 0..<100 {
      data.append("\(x)")
      print(data)
    }
    return data
  }
  
}
