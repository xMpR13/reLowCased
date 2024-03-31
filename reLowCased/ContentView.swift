import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("reLowCased")
                    .bold()
                    .font(.system(size: 50))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                Spacer()
            
                
                Text("a simple iOS app using SwiftUI with a text input field, two buttons to convert text to lowercase or uppercase, and an option to copy the converted text to the clipboard. It uses vertical and horizontal stacks for layout and simple color schemes with padding for a clean appearance.")
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                
              Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: ToCase()) {
                        Text("toUpLowCase")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(5.0)
                    
                    
                    Spacer()
                    NavigationLink(destination: ToEncrypt()) {
                        Text("toEncrypt")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(5.0)
                    
                    Spacer()
                }
                Spacer()
            }
            .navigationBarTitle("reLowCased")
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
