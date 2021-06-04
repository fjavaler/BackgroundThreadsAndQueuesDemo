//
//  ContentView.swift
//  BackgroundThreadsAndQueuesDemo
//
//  Created by Fred Javalera on 6/3/21.
//

import SwiftUI

struct BackgroundThreadView: View {
  
  // MARK: Properties
  @StateObject var vm = BackgroundThreadViewModel()
  
  // MARK: Body
  var body: some View {
    
    ScrollView {
      
      LazyVStack(spacing: 10) {
        
        Text("Load Data".uppercased())
          .font(.largeTitle)
          .fontWeight(.semibold)
          .onTapGesture {
            vm.fetchData()
          }
        
        ForEach(vm.dataArray, id: \.self) { item in
          Text(item)
            .font(.headline)
            .foregroundColor(.red)
          
        }
        
      }//: VStack
      
    }//: ScrollView
  
  }//: Body

}//: View

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundThreadView()
  }
}
