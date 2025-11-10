
import SwiftUI

struct ContentView: View {
    
    @State var result :[Student] = []
     let url = URL(string: "https://mocki.io/v1/e2f72a74-218a-47c3-9db8-4bb2cf12b05a")!
    
    @State var search = ""
    
    var body: some View {
        NavigationView{
        VStack{
            Text("Students")
                .font(.headline)
                .fontWeight(.bold).padding()
            HStack{
                
            Button("Get Students Data"){
                
                Task{ await fetchStudent() }
                
            }.buttonStyle(.borderedProminent)
                .padding()
                
                Button("Encode"){
                    
                    if let encoded = try? JSONEncoder().encode(result), let jsonString = String(data: encoded, encoding: .utf8)
                    {
                        print(jsonString)
                    }
                    
                }.buttonStyle(.borderedProminent)
                    .padding()
            }
            List{
                ForEach(result.filter{ stud in
                    search.isEmpty || stud.name.localizedCaseInsensitiveContains(search)
                } , id: \.name){ student in
                    
                    Text("Name :\(student.name)")
                    Text("Age :\(String(student.age))")
                    
                }
            }.padding()
                .cornerRadius(10)
        }.background(Color.gray.opacity(0.2))
        }     .searchable(text: $search)
        
    }
    @MainActor
    func fetchStudent() async {
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            result = try JSONDecoder().decode([Student].self, from: data)
        }catch{
            print("failed to fetch ",error )
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
