# Cricket UI

## Overview

Cricket UI is an iOS application designed to provide cricket enthusiasts with a user-friendly interface to access cricket match information. The app offers two main features: `Matches List` and `Scoreboard` allowing users to browse cricket matches and view detailed scoreboards for selected matches.

## Features

- **Matches List**
  - Filter matches by Start/End Date: Users can filter the list of cricket matches based on their start and end dates, making it convenient to find specific matches.

- **Scoreboard**
  - View detailed match scoreboards: Users can select a cricket match from the list to view its detailed scoreboard, including batting and bowling statistics, total score, and other relevant match information.

- **Light/Dark Mode**
  - Cricket UI supports both light and dark modes, allowing users to choose their preferred theme for the app.

## Design Pattern

Cricket UI follows the VIPER (View, Interactor, Presenter, Entity, and Router) design pattern, which ensures a modular and scalable architecture for the application. This separation of concerns allows for easier maintenance and testing of individual components.

## Technologies Used

- **Combine Framework**
  - The Combine framework is used for handling network requests in a reactive and efficient manner. It allows for the seamless integration of asynchronous data streams and error handling.

- **Codable Model**
  - The Codable model is utilized for parsing the API's response, converting JSON data into Swift objects and providing a structured representation of the match data.

## Installation

To install and run Cricket UI on your iOS device or simulator, follow these steps:

1. Clone the repository: `git clone https://github.com/daksheshtalaviya/cricket-ui-with-viper.git`
2. Open the project in Xcode: `cd CricketUI && open CricketUI.xcodeproj`
3. Set the appropriate development team and signing settings in Xcode.
4. Build and run the application on your device or simulator.

## Contributions

Contributions to Cricket UI are welcome! If you encounter any issues, have feature suggestions, or would like to contribute to the project, please create a pull request or open an issue on the GitHub repository.

## License

Cricket UI is released under the [MIT License](LICENSE), granting you the freedom to use, modify, and distribute the code within the terms specified in the license.

---

We hope you enjoy using Cricket UI to stay updated with the latest cricket matches and explore detailed scoreboards. Feel free to provide feedback and suggestions to help us improve the app further. Happy cricketing! 🏏
