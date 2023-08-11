# Technical-Assessment

A Technical assessment supports both web and mobile, clone the appropriate branches mentioned below:

- For Mobile & Web: https://github.com/zubairehman/flutter-boilerplate-project/tree/master (stable channel)

## Getting Started

The To-Do app enables users to create new to-do lists and subsequently modify them. Users are also able to mark their tasks as completed once they are done.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/zubairehman/flutter-boilerplate-project.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 3:**

For web, execute the following command:

```
flutter run -d chrome
```

For android, execute the following command:

````
flutter run
```

or can build the apk

````

flutter build apk --release

```

## Technical Assesment Features:

- Home
- To-Do

### Libraries & Tools Used

- [Iconsax](https://pub.dev/packages/iconsax)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Hive](https://pub.dev/packages/hive)
- [Calendar Picker](https://pub.dev/packages/calendar_date_picker2)
- [Intl](https://pub.dev/packages/intl)

### Folder Structure

Here is the core folder structure which flutter provides.

```

Technical-assessment/
|- android
|- build
|- ios
|- lib
|- linux
|- macos
|- test
|- web
|- windows

```

Here is the folder structure we have been using in this project

```

lib/
|- constants/
|- models/
|- screens/
|- utilities/
|- widgets/
|- main.dart

```

Now, lets dive into the lib folder which has the main code for the application.

```

1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `date format`, and `strings` .
2- models - Contains models of data listing.
3- screens - Contains screens of application.
4- utilities — Contains the utilities/common functions of your application.
5- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
6- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```

constants/
|- color.dart
|- date.dart
|- style.dart

```

### Models

All the list of model to ease the control of chunk of data.

```

models/
|- todo.dart
|- todo.g.dart

```

### Screens

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```

screens/
|- home
|- todo_form.dart

```

### Utilities

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

utils/
|- db_container.dart
|- servicers.dart

```

### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```

widgets/
|- custom_button.dart
|- fill_form.dart
|- todo_cart.dart

```

## Conclusion

I will be happy to answer any questions that you may have on this approach 🙂

```
