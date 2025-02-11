# News App

## Overview
This Flutter application fetches news articles from a public news API and presents them in a user-friendly interface. The app allows users to browse different categories of news and read detailed articles. It handles API calls efficiently, provides smooth navigation, and offers a visually appealing user experience.

## API Details
- **News API Endpoint:** [NewsAPI](https://newsapi.org/docs/endpoints/everything)
- **API Key:** `a1ace81e11144788909208aef9323531`
- **URI:** `https://newsapi.org/v2/everything?q=technology&sortBy=popularity&apiKey=a1ace81e11144788909208aef9323531`

## Screens
1. **Home Screen**: Displays top headlines, technology, and sports news.
2. **Category Screen**: Lists news articles within a selected category.
3. **Article Screen**: Displays the detailed content of a selected news article.

## Features
### API Integration
- Utilizes a public news API such as [NewsAPI](https://newsapi.org/) or [The New York Times API](https://developer.nytimes.com/apis).
- Fetches news articles based on different categories (e.g., Technology, Sports, Entertainment).
- Handles API authentication and ensures secure communication with the API endpoint.

### User Interface
- Home screen: Displays a list of news categories (Top Headlines, Technology, Sports).
- Category screen: Shows a list of news articles within a selected category.
- Article screen: Presents the detailed content of a selected news article.
- Implements smooth transitions between screens with intuitive navigation.
- Uses UI components such as cards, lists, and images for an enhanced visual experience.

### Functionality
- Allows users to select a news category from the home screen and view related articles.
- Enables users to tap on a news article to read its full content in a separate screen.
- Implements pagination to load more articles as the user scrolls.
- Includes options for refreshing the news feed and navigating back to the home screen.

### Error Handling & Loading States
- Displays loading indicators while fetching news articles.
- Handles network errors, API errors, and edge cases gracefully by showing informative error messages.

### Additional Features (Optional)
- **Search Functionality**: Allows users to search for specific news articles or topics.
- **Bookmarking**: Users can save articles for future reference.
- **Settings/Preferences**: Customization options such as theme selection and font size.

## Submission Guidelines
- Submit the source code along with clear instructions on how to run the app.
- Include necessary dependencies and setup instructions.
- Optionally, provide an overview of the app’s architecture, design patterns, and third-party libraries used.

## State Management
- It is **mandatory** to use state management in the task.
- You may choose any state management method of your preference.

---
This README provides a structured and comprehensive guide for the project. Let me know if you need any modifications!

