//
//  ContentView.swift
//  one
//
//  Created by apple on 2020/11/25.
//  Copyright © 2020 one. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var service:Service
    var body: some View{
        ANav(model: service.navi)
        AList(arr: service.array)
        
    }

}
struct ANav:View{
    var model:NSObject
    var body: some View{
        if(model is DogModel){
            let m = model as! DogModel
            Dog(model: m)
        }
    }
}
struct AList:View{
    var arr:[NSObject]
    var body: some View{
        List(0..<arr.count){ item in
            if(arr[item] is DogModel){
                let m = arr[item] as! DogModel
                Dog(model: m)
            }else if(arr[item] is CatModel){
                let m = arr[item] as! CatModel
                Cat(model: m)            
            }
        }
    }
}



struct Dog:View{
    var model:DogModel
    var body: some View{
        Text("Dog")
    }
}
struct Cat:View{
    var model:CatModel
    var body: some View{
        Text("cat")
    }
}

class DogModel:NSObject{
    
}
class CatModel:NSObject{
    
}

class Service{
    var array = [DogModel(),CatModel()]
    var navi = DogModel()
    func request(){
        
    }
}
