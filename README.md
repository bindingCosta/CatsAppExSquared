# **CatsAppExSquared!** 🐱

**Hello, I hope you're doing well!**

This is my submission for the mobile challenge, where I created an app to display cats with information about their breeds, using The Cat API. The language chosen for the development is Swift with SwiftUI, and the project follows the MVVM pattern with Clean Architecture principles applied.

---

# **Setup Instructions:** 📲

**To run the project, follow these steps:**

**1. Clone the repository:**

````

git clone <https://github.com/bindingCosta/CatsAppExSquared.git>

cd CatsAppExSquared

````

**2. Install dependencies (if any):**

````

swift package resolve

````

**3. Run the app:**

Select a simulator or device.

Press Cmd + R or click "Run" in Xcode.

**4. Project Dependencies**

This project uses native Swift frameworks, requiring no third-party dependencies:

SwiftUI for UI development, Combine for handling asynchronous operations, XCTest for unit and UI testing.

---

# **Code Architecture:** 👷🏻‍♂️

The project is structured based on Clean Architecture principles, organizing the layers clearly to promote scalability, maintainability, and testability:

**Views:** Responsible for building the user interface. This includes WelcomeView, CatListView, and CatDetailView (the breed details screen).

**ViewModels:** Contain the presentation logic and manage communication with the data layer. Examples: WelcomeViewModel, CatListViewModel, and CatDetailViewModel.

**Models:** Representations of the data, such as Cat, Breed, and Weight. These models represent the cat breeds and related information.

**Services:** Responsible for fetching data from the API and managing network logic. The CatService is used to retrieve cats' information.

**Resources:** Contains images and other static resources, such as icons.

**Tests:** Includes Unit and UI tests.

**The separation of concerns ensures clear communication between layers, and @StateObject and @ObservedObject are used for reactive UI updates.**

---

# **Implemented Tests:** 🔍

**Unit Tests**

**CatServiceTests:** Validates fetching data for cats, including error handling and mocking the API.

**CatListViewModelTests:** Tests the ViewModel for the Cat list, ensuring correct handling of data fetching and errors.

**WelcomeViewModelTests:** Ensures correct navigation logic from the Welcome screen.


**UI Tests**

**CatListViewTests:** Ensures the CatListView displays correctly and navigates between screens.

**WelcomeViewTests:** Validates navigation from the Welcome screen to the Cat List screen.

# **How to Run Unit/UI Tests** 🧪

**Unit Tests:**

Open CatsAppExSquared in Xcode.

Press Cmd + U or go to Product -> Test.

This runs tests located in CatsAppExSquaredTests.

**UI Tests:**

Navigate to CatsAppExSquaredUITests.

Run WelcomeViewTests and CatListViewTests.

UI tests verify screen transitions and element existence.

---

# **Considerations** 💡

Thank you for the challenge and for taking the time to review my test! I really enjoyed coding this and thinking through the details. Apologies for the delay in delivering it—I could only work on it during the late hours. That said, I truly believe I’ve achieved a smooth, well-structured, and clean result.


That’s all! I hope the code and the app meet the expectations of the team reviewing it. If possible, I’d love to receive feedback on what could be improved or altered in the architecture or logic of the code. Thank you again!

See you soon!
