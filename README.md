**# News App Overview**

## **Overview**
This is a Flutter news application that allows users to browse and read news articles based on different categories. The app supports pagination for seamless news browsing and includes a dark/light theme that adapts to the device's system theme.

## **Key Features**
- Users can select a news category from the home screen to view related articles.
- Users can tap on a news article to read its full content on a separate screen.
- Implemented infinite scrolling to load more articles as users scroll through the list (pagination).
- Navigation options to return to the home screen from any screen within the app.
- Displays loading indicators while fetching articles from the API.
- Dark and light theme support based on the device’s theme.
- App icon added for a polished look.

## **Tech Stack**
- **Flutter Version:** 3.27.1
- **State Management:** BLoC
- **API Handling:** Retrofit (using Dio)
- **News API Source:** [NewsAPI.org](https://newsapi.org/)

## **Project Structure**
```
assets

lib/
├───core
│   ├───apptheme
│   ├───error
│   └───network
├───model
├───presentation
│   ├───screens
│   └───widgets
│       └───home
├───repository
├───state
│   ├───article
│   ├───carousel
│   └───category
└───utils
```

## **Setup and Installation**

### **Prerequisites**
Ensure you have Flutter 3.27.1 installed. If not, install it from the [official Flutter website](https://flutter.dev/docs/get-started/install).

### **Steps to Run the App**
1. Clone the repository:
   ```sh
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```sh
   cd news_app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app on a connected device or emulator:
   ```sh
   flutter run
   ```

## **API Configuration**
This project uses [NewsAPI.org](https://newsapi.org/) for fetching news articles. To run the app, you need to obtain an API key and set it up in your project.

1. Get a free API key from [NewsAPI.org](https://newsapi.org/).
2. Add the API key to your environment variables or a config file in the project.

## **Contact**
If you have any questions or need further assistance, feel free to reach out!

