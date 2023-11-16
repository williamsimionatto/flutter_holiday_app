# flutter_holiday_app

Flutter Holiday App is a simple app that displays a list of national holidays from the [Brasil API](https://brasilapi.com.br/).

## Instructions for running the project

1. Clone the project
2. Run `flutter pub get` to install dependencies
3. Open the simulator or connect a device (Android or iOS)
4. Run `flutter run lib/main/main.dart` to run the project. Or utilize the launch configuration in VSCode (Hot Reload is enabled).

## Instructions for running the tests
1. Run `flutter test --coverage` to run all tests

## Architecture and Design Patterns

### Architecture
The project was developed using the [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) concepts.

The project was architected using layers, each layer has its own responsibility and is independent of the others. The layers are:

- **Domain**: This layer contains the business rules and the entities of the application. It is the most inner layer of the application and it is independent of the other layers.

- **Data**: This layer contains the implementation of the interfaces defined in the domain layer. It is responsible for retrieving data from the API or from the local database.

- **Infra**: This layer contains the implementation of the protocols defined in the data layer. It is responsible for implementing the access to the API and to the local database.

- **Presentation**: This layer is responsible for the presentation of the data to the user. It is responsible for formatting the data and for handling the user's input. Its layers communicates with the domain layer through the use cases.

- **UI**: This layer contains the widgets that are used in the presentation layer. It is responsible for displaying the data to the user and for receiving the user's input.

- **Main**: This layer contains the main function of the application. It is responsible for initializing the application using the dependency injection pattern.

- **Validation**: This layer contains the validation rules of the application. This layer is used in the `Presentation Layer` and in the `UI Layer` when the user's input is received.

An diagram of the architecture can be seen below:

The UI uses the MVP (Model-View-Presenter) pattern to display the data to the user. The MVP pattern was used to make the code more testable and to make the code more decoupled.

- **Model**: Much more than a simple data class, the model is a implementation of the domain use case on `Data Layer`. It is responsible for retrieving the data from the API or from the local database.

- **Presenter**: The presenter is responsible for recovering, formatting the data and for handling the user's input. It communicates with the model through the use cases. Additionally, it communicates with the view through the `ViewModel` pattern.

- **View**: The view is responsible for displaying the data to the user and for receiving the user's input. It communicates with the presenter through the `ViewModel` pattern.

- **ViewModel**: The view model is a object the contains the data that will be displayed to the user. It is used to make the communication between the view and the presenter more decoupled.

The diagram of the MVP pattern can be seen below:

#### Desing Patterns

The project was developed using the following design patterns:
- **Dependency Injection**: The dependency injection pattern was used to inject the dependencies of the classes. This pattern was used to make the code more testable and to make the code more decoupled.

- **Adapter**: The adapter pattern was used to adapt the data from the API to the data used in the application. This pattern was used to make the code more decoupled and to make the code more testable.

- **Factory**: The factory pattern was used to create the instances of the classes. This pattern was used to make the code more decoupled and to make the code more testable.

- **Solid Principles**: The SOLID principles were used to make the code more decoupled and to make the code more testable.

#### Tests

The project was developed using the following tests:
- **Unit Tests**: The unit tests were used to test the business rules of the application. This tests are applied to the `Data Layer`, `Domain Layer` and `Presentation Layer`.

- **Widget Tests**: The widget tests were used to test the widgets of the application. This tests are applied to the `UI Layer`.

- **Integration Tests**: The integration tests were used to test the integration between the layers of the application. This tests are applied to the `Data Layer`, `Domain Layer`, `Infra Layear`, `Presentation Layer` and `UI Layer`. Additionally, in the `Infra Layer` the integration tests were used to test the integration with external services and dependencies.

All tests utilize the `Mocks` and `Spies` concepts to make the tests more isolated and to make the tests more decoupled.
