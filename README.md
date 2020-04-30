#  WXChallenge - Micah Napier
Thank you for the opportunity to do this coding challenge.

## Approach
The challenge was created using VIPER which allows for a clear defined separation of concers between modules and ease of testing behavioral business logic. Every module has an individual responsibility 
and general knowledge of or integration with other modules is exposed through abstractions.

### Entities 
Two separated entities have been introduced to map the data and display layers respectively.

### Service
A service acts as an Interactor that integrates with a client to manage API calls in the app. The service exposes functionality through an abstraction which provides a benefit of not having to rely on 
any particular client to accomplish the task.

### ViewModel
The view model acts as a presenter and the facade between the view and the underlying integrations. It encapsulates the business logic and depends on an abstraction to expose the logic to the view.

### Coordinator
The coordinator assumes the router reponsibility which will encapsulate view controller management. Without a navigating app this module is quite bare, but still has an important benefit of keeping the knowledge of 
which controller should be the root VC away from the application delegate to allow for greater flexibility.


