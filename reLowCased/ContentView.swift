import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Text("ReLowCased")
                    .bold()
                    .font(.system(size: 50))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                Spacer()
            
                
                Text("This iOS app built with SwiftUI offers text manipulation features, allowing users to convert text to lowercase/uppercase and encrypt it using a Caesar cipher. It provides a clean interface with straightforward navigation and functionality, making it easy to use for modifying and securing text on iOS devices.")
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
       
                
                VStack {
                
                    NavigationLink(destination: ToCase()) {
                        Text("UPLOWCASE")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(5.0)
                    
                    
                    NavigationLink(destination: ToEncrypt()) {
                        Text("DE/ENCRYPT")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(5.0)
                    
                    
                    NavigationLink(destination: TextToSpeech()) {
                        Text("TextToSpeech")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(5.0)
                   
                }
               
                Text("super")
                    .foregroundColor(.gray)
                    .padding(10)
                    .cornerRadius(20)
            }
            .navigationBarTitle("ReLowCased")
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
