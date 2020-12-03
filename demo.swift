//
//  ContentView.swift
//  one
//
//  Created by apple on 2020/11/25.
//  Copyright © 2020 one. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var list:[Any] = [T1(),Test()]
    var body: some View {
        Text("Hello, world!")
            .padding()
        Item(m: list.first)
        Item(m: list.last)
    }
}

struct Item :View{
    var m:Any
    var body: some View{
        if m is Test {
            let t = m as? Test
            t?.render
        }else if m is T1 {
            let t = m as? T1
            t?.render
        }else{
            BaseView()
        }
    }
}

class Test{
    var render: some View{
        Text("sdf")
    }
}
class T1{
    var render: some View{
        Text("sdf")
    }
}





struct BaseView:View {
    var body: some View{
        Text("sdfsdfsf")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
