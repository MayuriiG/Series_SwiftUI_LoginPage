//
//  LoginView.swift
//  Github_LoginPAGE_Swiftui
//
//  Created by Mayurii on 1/22/26.
//
//takingdata from ViewModel-----------------------ViewMODEL API ||
import SwiftUI


struct LoginView: View {
    
    @StateObject private var viewModel = LoginModelView()
    
    var body: some View {
        VStack{
            Text("Login").font(.largeTitle)
            TextField("Email",text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password",text: $viewModel.pass).textFieldStyle(RoundedBorderTextFieldStyle())
            
           
            Button("Login"){
                if !viewModel.email.isEmpty && !viewModel.pass.isEmpty{
                    
                    Task{
                        print("Button")
                        await viewModel.loginCall()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding().background(Color.blue.opacity(0.60))
            .foregroundStyle(.white).cornerRadius(10)
            .allowsHitTesting(true)
            
            Text(viewModel.mess).foregroundColor(.green).padding()
          /*  Text(viewModel.token).font(.largeTitle).multilineTextAlignment(.center)*/
            
        }.padding()
    }
}

#Preview {
    LoginView()
}
