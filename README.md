# iFridge

A Flutter application that helps with shopping and grocery management. Features include:
* Grocery list with expiry dates
* Shopping list
* Object detection for food
* Recipes list

## Feature Showcase
### Grocery list
Users can edit their groceries list to contain the items in their fridge/pantry. Each item includes name, food category, quantity and expiry date. Expiry date is defulted to the recommended date of that food category but can be specified. Phone's camera can also be used to quickly add item(s) to the list.
### Shopping list
Users can edit their shopping list to reflect what they wish to buy. Items include name and quantity. Items missing from a recipe can be easily added to this list
### Object detection for food
Users can take pictures of items they purchased to be easily added to their groceries list. Application uses Google Vision AI for object detection. None food related objects detected are filtered out.
### Recipes List
List of recipes that contains ingrediants found in the groceries list. Recipe items includes a picture showcase, time to make, list of ingrediants and list of steps. Missing ingrediants can be easily added to the shopping list.

## Installation and Usage

A few resources to get you started with this Flutter project

- [Install Flutter](https://flutter.dev/docs/get-started/install)
- [Install Android Studio](https://developer.android.com/studio)

To make sure everything is installed properly, run
```
flutter doctor
```

To get the APK, run
```
flutter build apk
```

## Setting up the environment 

Do these steps if you are planning to use your own firebase.
1. Go to console.firebase.com
2. Click on your project
3. Go to settings - general 
4. Scroll to the "Your apps" section and download the `google-services.json` from the Android app 
and the `GoogleService-info.plist` from the iOS app. Save these for later.

### Android Configuration 

1. In the `android/app` folder, place the `google-services.json` from step 4. 


### iOS Configuration 

1. In Xcode, open the `ios/Runner.xcodeproj` project. 
2. In the root `Runner` project. 
3. Drag the `GoogleService-info.plist` from step 4. above into this folder. 

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
