# MVVM-Unidirectional-Data-Flow-RxSwift-Behance-Client

         Behance client to be
         
         Branches: master and v2
         
         I wanted to use/show different approaches in this first version.
         Please read below to see what has been done, how it has been done.
         You will see todos for version 2 soon.
         
         Currently version 1
         - App has been developed to use different kind of approaches to create views, data flow, 
         navigation flow, dependency injection.
         - Considered MVVM, RxSwift, Unidirectional Data Flow, Protocol Oriented approach to create views, 
         data flow.
         
         LaunchViewController;
         - used Unidirectional Data Flow to observe state changes
         - used dispatch actions to update view or/and push/present views.
         
         ProfileViewController;
         - considered protocol oriented approach to create multiple type of collection 
         view cells with Datasource, Delegates.
         
         //TODO:
         - change dependency injection  (DONE in branch v2)
         (see. LaunchViewModel injection to LaunchViewController via dependency container.)
         
         
         ProjectViewController;
         - considered Rx way to populate collection view. 
         Same protocol oriented approach to create multiple type of cells like 
         in Profile View Controller except no datasource.
         - Viewmodel Input/Output; I have seen this approach one of the 
         Pinterest engineers was explaning how their view model structure is. 
         Liked it, used in one of my projects as well. One of my favorite approach using with RxSwift.
         
         //TODO:
         - change dependency injection
         
         
         TODO for version 2
         - Usecases for operations. (fetch,etc.) Currently higher functions to 
         fetch data from files in Bundle.
         - Entire app works through Uni Data Flow
         - Refactor everything to RxSwift
         - ViewModels Input/Output style
         - Design / Styling
         - Behance API Connect
         - Projects & Creatives to Follow Views implementation
