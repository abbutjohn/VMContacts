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


<img width="685" alt="Screenshot 2022-10-08 at 13 13 37" src="https://user-images.githubusercontent.com/83579629/194706987-eafd7723-5c76-4609-bd8c-e18f2398830a.png">


For reusability of the modules , designed the networklayer sepratly as framework. This will help other developers to impliment new api calls in it and test it sepratly and also help to resue the module easily to another project. Rooms and Contacts also indepdently designed to reuse in future

For App , selected MVVM archituture and the viewmodels communictaed to Viewcontrollers using clousers. MVVM will help us to test business logic and also give oppertunity to replace the View to SwiftUI in fucture.

UnitTest added for all methods in the Viewmodels with the help of mock services.

The brnding colour added to UIcolour extentions and in future we can add more colours to this and use in the app.

The code did in swift 5 with help of storyboard

Accessibilty auditing did for the app.

Tha app is visually designed with tabbar with two viewcontroller

The contacts view controller shows with tableview and serchbar , when user tap on contact the navigation will take you to Details screen. Prefetching not implimented because the data set is comaparitevly small.


The roomViewcontroller shows all the rooms with filter of occupied rooms option in navaiagtion bar.

The app is designed to support ipad as well as iphone












 
