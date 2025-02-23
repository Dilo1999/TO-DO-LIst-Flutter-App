To-Do List App

A simple To-Do List app built using Dart and Flutter, which allows users to add, edit, delete, and view tasks along with associated dates. The app uses SQLite as the local database to store tasks persistently.

Features
	Add a new task with a title, description, and date.
	Edit existing tasks.
	Delete tasks.
	View a list of all tasks with the date.
	Simple UI with Flutter's material design.

Approach
  This app uses the following approach to manage and display tasks:

Database Handling:
  The sqflite package is used for local storage.
  A singleton DatabaseHelper class handles the database operations: adding, retrieving, updating, and deleting tasks. It creates a tasks table with fields: id, title, description, and date.
  Task Model:
  The Task class is a data model representing a task. It contains a title, description, and date (in addition to an optional id field for identification).
  UI Structure:
  The TaskListScreen displays all tasks in a list and provides options to add, edit, or delete tasks.
  The TaskDetailScreen allows users to add or edit a task. It includes a form with fields for the title, description, and date (which is picked using a date picker).
  Date Handling:
  The app allows users to select a date using Flutter's showDatePicker widget, and it displays the selected date in the format YYYY-MM-DD.
  Prerequisites
  Make sure you have the following installed:

Flutter
Dart
An IDE like VS Code or Android Studio
Setup Instructions

Clone the repository:
git clone https://github.com/Dilo1999/TO-DO-LIst-Flutter-App.git  
cd todo-list-app

Install dependencies: Run the following command in the project directory to install the required packages:


flutter pub get
Run the app: You can run the app using an emulator or a connected device:


flutter run

How to Use
On the home screen, you will see a list of tasks (if any). You can:

Tap the floating action button (+) to add a new task.
Tap a task to edit it.
Swipe to delete a task, or use the delete button in the task card.
The task detail screen allows you to add or edit the title, description, and date of a task. Once done, click "Save" to store the task.

The app will persist tasks even after the app is closed and reopened, as they are stored in an SQLite database.

Dependencies
  	sqflite: SQLite plugin for Flutter to manage the local database.
  	path: Utility to help with database file location.
  	flutter: Flutter SDK for building cross-platform apps.
  	Future Enhancements
  	Add a feature to mark tasks as completed.
  	Implement task prioritization.
  	Implement search functionality to find tasks easily.
