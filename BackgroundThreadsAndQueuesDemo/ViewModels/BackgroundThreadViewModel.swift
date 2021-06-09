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
    
    // Creates a new background thread.
    DispatchQueue.global(qos: .background).async {
      
      let newData = self.downloadData()
      
      print("Check 1: \(Thread.isMainThread)")
      print("Check 1: \(Thread.current)")
      
      // This line affects the UI, so we need to jump back to the main thread and run it there.
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
