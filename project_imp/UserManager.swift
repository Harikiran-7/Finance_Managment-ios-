
class UserManager {
    static let shared = UserManager()
    var users: [User]

    private init() {
        // Initialize with the default user
        users = [User(username: "harikiran", password: "hari", transactions: [
            Transaction(amount: 5000, description:"pocket money"),
            Transaction(amount: -20, description:"auto charge morning"),
            Transaction(amount: -65, description: "afternoon food")
        ])]
    }

    func addUser(_ user: User) {
        users.append(user)
    }

    func getUser(username: String, password: String) -> User? {
        return users.first { $0.username == username && $0.password == password }
    }
    
    func usercount()-> Int{
        return users.count
    }

    // Other user management methods can go here
}
