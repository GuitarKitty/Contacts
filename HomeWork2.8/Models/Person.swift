
import Foundation

struct Person {
    
    var name: String
    var surname: String
    var email: String
    var phoneNumber: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getContactList() -> [Person] {
        
        var persons: [Person] = []
        
        let names = DataManager.shared.names
        let surnames = DataManager.shared.surnames
        let emails = DataManager.shared.emails
        let phones = DataManager.shared.phones
        
//        let iterationCount = min(names.count, surnames.count, emails.count, phones.count)
        
        for index in 0..<names.count {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                email: emails[index],
                phoneNumber: phones[index]
            )
            
            persons.append(person)
        }
        
        return persons
    }
}

enum Contacts: String {
    case phone = "phone"
    case email = "tray"
}
