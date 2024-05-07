//
//  ContentView.swift
//  Diseno
//
//  Created by Frank on 7/05/24.
//

import SwiftUI

// vstack vertical
// hstack horizontal
// zstack fondo

struct ContentView: View {
    
    // valores de entorno o environmentValues
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact{
            compactDesign()
        }else{
            regularDesign()
        }
    }
}

struct compactDesign: View{
    
    let numero = "+51960916014"
    let mensaje = "Hola como estas?"
    
    func sendMessage(){
        let sms = "sms:\(numero)&body=\(mensaje)"
        guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil )
    }
    
    func sendCall(){
        guard let number = URL(string: "Tel://\(numero)") else {
            return
        }
        UIApplication.shared.open(number)
    }
    
    
    var body: some View{
        ZStack{
            Color.green.ignoresSafeArea(.all)
            VStack(){
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100, weight: .bold))
                Text("Frank Alva").font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Calle #123")
                    .foregroundColor(.white)
                    .font(.title)
                    .italic()
                HStack{
                    Button(action: {
                        sendCall()
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(boton(color: .blue))
                    }
                    Button(action: {
                        sendMessage()
                    }){
                        Image(systemName: "message.fill")
                            .modifier(boton(color: .red))
                    }
                }
            }
        }
    }
}


struct boton : ViewModifier{
    var color: Color
    func body(content: Content) -> some View {
        content.padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}


struct regularDesign: View{
    var body: some View{
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            HStack(){
                
                Image("images").resizable().frame(width: 130, height: 100, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10){
                    Text("Frank Alva").font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle #123")
                        .foregroundColor(.white)
                        .font(.title)
                        .italic()
                    Image(systemName: "globe")
                        .font(.largeTitle)
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
