//
//  AdvanceView.swift
//  CalculatorApp
//
//  Created by Santiago Aristizabal on 1/9/25.
//

import SwiftUI

struct AdvanceView: View {
    @State var DEG = "DEG"
    @State var input: String = ""
    @State var result: String = ""
    
    let columns = [GridItem(.adaptive(minimum: 80))]
    let values = [
        "AC", "()", "%", "/",
        "7","8","9","*",
        "4","5","6","-",
        "1","2","3","+",
        "0",".","del","="
    ]
    var body: some View {
        VStack {
            VStack {
                    HStack {
                        Text(DEG)
                            .foregroundColor(Color.blue)
                        Spacer()
                            }
                            HStack {
                                Spacer()
                                VStack {
                                    Text(input)
                                        .foregroundColor(.gray.opacity(0.5))
                                        .font(.system(size: 40))
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Text(result)
                                        .font(.system(size: 50))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
            VStack{
                LazyVGrid(columns: columns) {
                    ForEach(values, id: \.self){value in
                        Button{calculate(value: value)}
                        label: {
                            Text(value)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(buttonBackground(value:value))
                                .cornerRadius(50)
                                .shadow(radius: 12)
                                .foregroundColor(Color.black)
                        }
                        
                    }
                }
            }.padding()
            .background(Color.pink.opacity(0.1))
        }
    }
    
    func buttonBackground(value: String) -> Color{
        if ["/","*","-","+","="].contains(value){
            return Color.pink.opacity(0.1)
        }
            return Color.white
    }
    
    func calculate(value:String){
        switch value{
        case "AC":
            input = ""
            result = ""
        case "del":
            if !value.isEmpty{
                input.removeLast()
            }
        case "=":
            calculateResultado()
        default:
            input += value
        }
    }
    
    func calculateResultado(){
        let exp = NSExpression(format: input)
        if let calcularResult = exp.expressionValue(with: nil, context: nil) as? NSNumber{
            result = String(describing: calcularResult)
        }else{
            result =  "error"
        }
    }
}

#Preview {
    AdvanceView()
}
