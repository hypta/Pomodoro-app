# Pomodoro App

This repository contains a Pomodoro App written in Flutter that helps users to manage their time and to-do list and increase productivity. Flutter is a UI toolkit that allows developers to build cross-platform apps from a single codebase. The app is designed to use the Pomodoro Technique, a time management method that breaks work into intervals, traditionally 25 minutes in length.

## Video introduction

 - [Video link](https://drive.google.com/file/d/1f3shb2FkM7_R8KX_96aHX9UAoowJ-a--/view?usp=share_link)
 - [Slides link](https://drive.google.com/file/d/1DCBLxqQ-w_eyu77YcqL8DHydvSh8sF2J/view?usp=sharing)

## Supported platforms

This app can be built to run on different platforms, depending on the development environment you are using:
![supported_platforms](/spec/Supported%20platforms.png)

## Installation

You need to install different tools based on the dev environment and the platform on which you want to run this app. Here is a quick preview:
![installation](/spec/Installation.png)

In the intro video, we've seen the demo of running this app on an actual Android phone, but the easiest way to get this codebase to work is to run it as a web app. 

**This install instruction aims to help you run the app in a web browser**; however, you are welcome to try to run it on other platforms by following the [Install](https://docs.flutter.dev/get-started/install) section on the Flutter documentation website.

For macOS, jump to [macOS install](#macos-install); for Windows, jump to [Windows install](#windows-install).

### macOS install

1. Make sure that your development environment meets the [system requirements](https://docs.flutter.dev/get-started/install/macos#system-requirements).

2. Download the latest Flutter SDK for macOS from [Flutter website](https://docs.flutter.dev/get-started/install/macos#get-sdk). Follow the instructions on that page to unzip it in the desired location and [update the PATH variable permanently](https://docs.flutter.dev/get-started/install/macos#update-your-path) so that you can run Flutter commands.

3. Make sure you have installed [Xcode](https://developer.apple.com/xcode/) or at least the Command Line Tools for Xcode.

4. Make sure you have installed Google [Chrome](https://www.google.com/chrome/) browser.

5. Open one of the recommended editors (VS Code or IntelliJ) and install the Flutter plugin/extension. This should also install the Dart plugin/extension.

6. Run ```flutter doctor``` in the terminal to verify the installation from the previous steps. You should be able to see the Doctor summary like this:
    ![doctor](/spec/doctor_summary_mac.jpg)
    You can ignore the issues shown in the screenshot if you just want to run it as a web app. To run this app, continue with [Run the app](#run-the-app).

### Windows install

1. Make sure that your development environment meets the [system requirements](https://docs.flutter.dev/get-started/install/windows#system-requirements).

2. Download the latest Flutter SDK for Windows from [Flutter website](https://docs.flutter.dev/get-started/install/windows#get-the-flutter-sdk). Follow the instructions on that page to unzip it in the desired location and [update your path](https://docs.flutter.dev/get-started/install/windows#update-your-path) so that you can run Flutter commands.

3. Make sure you have installed Google [Chrome](https://www.google.com/chrome/) browser.

4. Open one of the recommended editors (VS Code or IntelliJ) and install the Flutter plugin/extension. This should also install the Dart plugin/extension.

5. Run ```flutter doctor``` in the terminal to verify the installation from the previous steps. You should be able to see the Doctor summary like this:
    ![doctor](/spec/doctor_summary_windows.png)
    You can ignore the issues shown in the screenshot if you just want to run it as a web app. To run this app, continue with [Run the app](#run-the-app).

## Run the app

1. Clone this repository to your local computer and open it in the editor that has the Flutter plugin/extension.

2. Your IDE should give you the notification like this:
    ![rub_pub_get](/spec/run_pub_get.png)
    Click __Run 'pub get'__ or run ```flutter pub get``` in the terminal to update the dependencies.

3. Launch the web app in debug mode

    a. If you are using VS Code as the editor, locate the status bar at the bottom and make sure you have selected __Chrome (web-javascript)__ as your device. Navigate to the "Run and Debug" tab and click __Run and Debug__.
    ![vscode_status](/spec/vscode_status_bar.png)
    
    b. If you are using IntelliJ as the editor, locate the main toolbar at the top, make sure you have selected __Chrome (web)__ as your device and click the run icon.
    ![intellij_run](/spec/intellij_run.png)

    c. Instead of selecting the device from the IDE, you can run ```flutter run``` in the terminal and choose __Chrome__ to launch the web app.
    ![flutter_run](/spec/flutter_run.png)

4. A new Chrome window will be opened and you will see the web app like this:
![pomodoro_app](/spec/pomodoro_app.png)

The Pomodoro Timer App has a simple and intuitive user interface that allows you to start a Pomodoro session, pause and resume the timer, and reset the timer. It also includes a To-Do list where you can add the tasks that you want to complete during your Pomodoro session. You can also mark finished and delete tasks.

Feel free to play around with the app regarding the topics we discussed in the video, for example, adding widgets, performing hot reload and exploring the Material Design.

## Other resources

### Flutter
- [Flutter online documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

### Material Design

- [Material Design for Flutter](https://docs.flutter.dev/development/ui/material)
- [Material 3 demo website](https://flutter.github.io/samples/web/material_3_demo/#/)
