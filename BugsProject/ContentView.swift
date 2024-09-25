//
//  ContentView.swift
//  BugsProject
//
//  Created by Gerson Janhuel on 24/09/24.
//

import SwiftUI


struct ContentView: View {
    @State private var users: [User] = []
    @State private var selectedUser: User?
    @State var jsonFileName = "useers"
    
    var body: some View {
        NavigationView {
            VStack {
                if users.isEmpty {
                    Text("No users available")
                } else {
                    List(users) { user in
                        Button(action: {
                            selectedUser = user
                        }) {
                            Text(user.name)
                        }
                    }
                }
            }
            .navigationTitle("User List")
            .onAppear {
                loadUsers()
            }
            .sheet(item: $selectedUser) { user in
                UserDetailsView(user: user)
            }
        }
    }

    func loadUsers()  {
        
        let url = Bundle.main.url(forResource: getJsonFileName(), withExtension: "json")!
        
        let data = try? Data(contentsOf: url)
        
        let decodedUsers = try? JSONDecoder().decode([User].self, from: data!)
        
        self.users = decodedUsers!
        
    }
    
    func getJsonFileName() -> String {
        jsonFileName = "users"
        return "user"
    }
}

#Preview {
    ContentView()
}
