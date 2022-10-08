# VMContacts


Problem Statement


· See and use all their colleagues contact details.
· See which rooms in the office are currently occupied.
Your task is to create this app in Xcode (ideally the latest non-beta version) using Swift 5.0+ and targeting iOS 11. It should contain list/detail pages for the people and a list page for the rooms. It should include features that you deem important to delivering the desired experience to the user.
The actual design does not matter, however the consistency in which you implement your chosen design style does.
This task is designed to test your ability to functionally design an app that meets real-world use goals. This skill is important to us.
Additionally, we are interested in the way your app is structured (how the UI interacts with the data, how your file structure is set out) so keep this in mind.
The code should be structured in such a way that the app is easily testable.
It should not be written using SwiftUI, though we may consider using it in the future so bear this in mind when writing your views.


Solution


System Design

For reusability of the modules , designed the networklayer sepratly as framework. This will help other developers to impliment new api calls in it and test it sepratly and also help to resue the module easily to another project.

For App I choose MVVM archituture and the viewmodels communictaed to Viewcontrollers using clousers. MVVM will help us to test business logic and also give oppertunity to replace the View to SwiftUI in fucture.

<img width="685" alt="Screenshot 2022-10-08 at 13 13 37" src="https://user-images.githubusercontent.com/83579629/194706987-eafd7723-5c76-4609-bd8c-e18f2398830a.png">
