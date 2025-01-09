//
//  GeneralView.swift
//  CalculatorApp
//
//  Created by Santiago Aristizabal on 1/9/25.
//

import SwiftUI

struct GeneralView: View {
    @State var deg = "DEG"
    @State var valueUser = ""
    @State var result = ""
    
    struct calculator:Identifiable, Hashable{
        var id: Int
        var value: String
    }
    
    var columns = [GridItem(.adaptive(minimum: 80))]
    var values: [calculator] = [
        calculator(id: 0, value: "AC"),
        calculator(id: 1, value: "()"),
        calculator(id: 2, value: "%"),
        calculator(id: 3, value: "/"),
        calculator(id: 4, value: "7"),
        calculator(id: 5, value: "8"),
        calculator(id: 6, value: "9"),
        calculator(id: 7, value: "x"),
        calculator(id: 8, value: "4"),
        calculator(id: 9, value: "5"),
        calculator(id: 10, value: "6"),
        calculator(id: 11, value: "-"),
        calculator(id: 12, value: "1"),
        calculator(id: 13, value: "2"),
        calculator(id: 14, value: "3"),
        calculator(id: 15, value: "+"),
        calculator(id: 16, value: "0"),
        calculator(id: 17, value: "."),
        calculator(id: 18, value: "del"),
        calculator(id: 19, value: "=")
    ]
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Text(deg)
                        .foregroundColor(Color.blue)
                    Spacer()
                    
                    }
                HStack{
                    Spacer()
                    VStack{
                        Text(valueUser)
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
            }.padding()
                .background(Color.white.opacity(0.1))
            VStack{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(values){ value in
                        Button{buttonPress(value: value.value)}label: {
                            Text(value.value)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .cornerRadius(40)
                                .foregroundColor(.black)
                                .shadow(radius: 5)
                        }
                    }
                }
            }.padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.pink.opacity(0.1))
                    
            )

        }
        
    }
    func buttonPress(value: String){
        switch value{
        case "AC":
            valueUser = ""
            result = "0"
        case "del":
            if !valueUser.isEmpty{
                valueUser.removeLast()
            }
        case "=":
            calculateResult()
            
        default:
            valueUser += value
            
        }
        
        
    }
    
    func calculateResult(){
        let expression = valueUser
            .replacingOccurrences(of: "x", with: "*")
            .replacingOccurrences(of: "%", with: "*0.01")
        let exp = NSExpression(format: expression)
        if let calcResult = exp.expressionValue(with: nil, context: nil) as? NSNumber{
            result = String(describing: calcResult)
        }else{
            result = "Error"
        }
        
    }
}

#Preview {
    GeneralView()
}
