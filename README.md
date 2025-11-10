# 💾 JSON Parse App (SwiftUI)

A simple **SwiftUI app** that demonstrates how to **decode and encode JSON data** using Swift’s `Codable` protocol.  
It fetches student data from a remote JSON API, displays it in a list, and allows encoding the data back into JSON.

---

## 🧩 What the App Does

- Fetches JSON data from a REST API using `URLSession`  
- Decodes the JSON into Swift structs using `Decodable`  
- Displays the parsed data (name & age) in a SwiftUI `List`  
- Encodes the data back into JSON using `Encodable`  
- Includes a **search bar** to filter students by name  

---

## 🧠 Key Concepts

- `Codable` (combines `Decodable` + `Encodable`)  
- `JSONDecoder` and `JSONEncoder`  
- `async/await` with `URLSession`  
- SwiftUI `List`, `NavigationView`, and `.searchable` modifier  

---

## 🚀 Features

- 🔄 Fetch & decode JSON data asynchronously  
- 🧾 Encode Swift data back to JSON  
- 🔍 Real-time search filtering  
- 🧠 Demonstrates clean use of SwiftUI state management  

---

## 🧱 Tech Stack

- **Language:** Swift  
- **Framework:** SwiftUI  
- **Networking:** URLSession (async/await)  
- **Data Handling:** Codable (JSONEncoder / JSONDecoder)  

---

## 🧾 Example Code Snippet

```swift
struct Student: Codable {
    var name: String
    var age: Int
}

@MainActor
func fetchStudent() async {
    do {
        let url = URL(string: "https://mocki.io/v1/e2f72a74-218a-47c3-9db8-4bb2cf12b05a")!
        let (data, _) = try await URLSession.shared.data(from: url)
        result = try JSONDecoder().decode([Student].self, from: data)
    } catch {
        print("Failed to fetch:", error)
    }
}
