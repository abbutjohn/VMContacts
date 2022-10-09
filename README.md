# VMContacts


Problem Statement


· See and use all their colleagues contact details.
· See which rooms in the office are currently occupied.
Your task is to create this app in Xcode (ideally the latest non-beta version) using Swift 5.0+ and targeting iOS 11. 


Solution


System Design


<img width="685" alt="Screenshot 2022-10-08 at 13 13 37" src="https://user-images.githubusercontent.com/83579629/194706987-eafd7723-5c76-4609-bd8c-e18f2398830a.png">


For reusability of the modules , designed the networklayer sepratly as framework. This will help other developers to impliment new api calls in it and test it separately and also help to reuse the module easily to another project. Rooms and Contacts are also indepedently designed to be reused in the future

For App , selected MVVM archituture and the viewmodels are communicated to Viewcontrollers by using clousers. MVVM will help us to test business logic and also gives opportunity to replace the View to SwiftUI in the future.

UnitTest is added for all methods in the Viewmodels with the help of mock services.

The branded colour is added to UIcolour extensions and in the future more colours could be added to this and be used in the app.

The code has been done in swift 5 with the help of storyboard

Accessibilty auditing is done for the app.

Tha app is visually designed with tabbar with three viewcontroller, contacts, contact details and room.

The contacts view controller shows with tableview and serchbar , when user tap on contact the navigation will take you to Details screen. Prefetching not implimented because the data set is comaparitevly small.


The roomViewcontroller shows all the rooms with filter of occupied rooms option in navaiagtion bar.

The app is designed to support ipad as well as iphone

Support folder contains some  common classes and assets.

Protocols are used for dependency injection.

singleton pattern is used in app for networkservice.

searchbar is used in contacts for easily accessising/finding contacts












 
