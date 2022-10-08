# VMContacts


Problem Statement


VM would like a directory app to allow staff to:
· See and use all their colleagues contact details.
· See which rooms in the office are currently occupied.
Your task is to create this app in Xcode (ideally the latest non-beta version) using Swift 5.0+ and targeting iOS 11. It should contain list/detail pages for the people and a list page for the rooms. It should include features that you deem important to delivering the desired experience to the user.
The actual design does not matter, however the consistency in which you implement your chosen design style does.
This task is designed to test your ability to functionally design an app that meets real-world use goals. This skill is important to us at VM.
Additionally, we are interested in the way your app is structured (how the UI interacts with the data, how your file structure is set out) so keep this in mind.
The code should be structured in such a way that the app is easily testable.
It should not be written using SwiftUI, though we may consider using it in the future so bear this in mind when writing your views.
🔌 Data Source The API that provides the necessary data is located at https://61e947967bc0550017bc61bf.mockapi.io/api/v1/ and is RESTful with 2 endpoints:
· people
· rooms
Both support GET requests to list the data and to directly access individual records (the API is currently read only).
📖 Development Story
The following story around how the app will be used should inform how you approach development/code structure:
VM aims to use their branding in all their internal services. They currently use a main brand colour #C40202 however they are in the initial stages of a rebrand that may lead this to change soon.
All employees will have access to the app and will expect the ability to quickly pull up and use the contact details of any of their colleagues. All details of the contact should be displayed in the app. Employees use iOS devices across the full range, so your implementation must work across iPhones and iPads. Several of our employees use the accessibility features of iOS, so your app must be accessible.
If the trial of the Directory app proves successful with the staff, VM may look to expand the app so that it will also allow users to access and administer more data, so ensure that the app can be easily expanded both in terms of codebase and UX. The code from this app could be used in other applications so modularity is important. If the app expands in scope, it will be more rigorously tested by our QA resource and will therefore need to support a test environment as well as a live environment.
VM cannot guarantee that the same developer(s) will always be working on this app throughout its lifecycle, so it is important that other developers will be able to onboard themselves onto the codebase with ease.
Finished! Now what?
Store your code on a repo, either GitHub or Bitbucket, and email the link
