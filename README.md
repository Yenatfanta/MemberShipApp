# ChurchMembershipApp

ChurchMembershipApp is a Swift-based iOS application designed to help churches manage members, activities, and events efficiently. It follows the **MVVMC (Model-View-ViewModel-Coordinator) architecture**, ensuring modularity, scalability, and maintainability. The project adheres to **SOLID principles**, making the codebase clean, reusable, and easy to test.

---

## 📌 Features
- ✅ **MVVMC Architecture**: Implements Coordinators for efficient navigation and separation of concerns.
- ✅ **SOLID Principles**: Ensures maintainability with clean code and best practices.
- ✅ **User Authentication**: Secure login and sign-up with **Keychain storage** for authentication credentials.
- ✅ **Dashboard Management**: Allows users to navigate to different church-related features.
- 🛡 **Data Security**: Utilizes **Keychain** for secure authentication data storage.
- 📡 **Networking**: Efficient data retrieval and API handling.
- 📱 **Modern UI**: Clean, user-friendly design using **UIKit**.
- 🔍 **Generic & Reusable Code**: Implements **protocol-oriented programming** for better reusability.
- 🧪 **Unit & UI Testing**: Comprehensive test coverage using **XCTest**.

## 🏗 **Architecture: MVVMC**
ChurchMembershipApp follows the **MVVMC (Model-View-ViewModel-Coordinator) architecture**, which:
- 📌 **Separates concerns** to keep the code modular and maintainable.
- 📌 Uses **Coordinators** to manage navigation efficiently.
- 📌 Implements **Dependency Injection** for better testability.
- 📌 Follows **Protocol-Oriented Programming** to improve reusability.
---

## 🚀 **Getting Started**

### 1️⃣ **Prerequisites**
- ✅ **Xcode** (latest version recommended)
- ✅ **Keychain Access** (for authentication storage)
- ✅ **Firebase Project** (If Firebase is used, ensure `GoogleService-Info.plist` is added)

### 2️⃣ **Installation**
#### **Clone the Repository**
```sh
git clone https://github.com/your-username/ChurchMembershipApp.git
cd ChurchMembershipApp
