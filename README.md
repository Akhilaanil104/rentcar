<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.8; margin: 0; padding: 20px; background-color: #f5f5f5; color: #333;">
    <h1 style="color: #222; font-size: 2.2em; margin-bottom: 15px;">Rent A Car</h1>
    <p>
        <strong>Rent A Car</strong> is a Flutter-based mobile application designed to simplify the car rental process. 
        The app offers an intuitive user experience while integrating advanced features such as 
        Firebase for backend operations, Google Maps for location tracking, and Stripe for secure payment handling.
    </p>

  <h2 
 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">Features
    </h2>
    <h3 style="color: #222; font-size: 1.4em; margin-bottom: 10px;">1. Firebase Integration</h3>
    <ul style="padding-left: 20px; margin-bottom: 20px;">
        <li><strong>Firestore:</strong> Stores and retrieves car details and user data.</li>
        <li><strong>Authentication:</strong> User login and registration using Firebase Authentication.</li>
    </ul>

   <h3 style="color: #222; font-size: 1.4em; margin-bottom: 10px;">2. Google Maps Integration</h3>
    <ul style="padding-left: 20px; margin-bottom: 20px;">
        <li><strong>Location Display:</strong> Shows car locations on Google Maps using GeoPoint data from Firebase.</li>
    </ul>

   <h3 style="color: #222; font-size: 1.4em; margin-bottom: 10px;">3. Payment Integration</h3>
    <ul style="padding-left: 20px; margin-bottom: 20px;">
        <li><strong>Stripe:</strong> Provides a secure and seamless payment gateway for transactions.</li>
    </ul>
    <h3 style="color: #222; font-size: 1.4em; margin-bottom: 10px;">4. User-Friendly Interface</h3>
    <p style="margin-bottom: 20px;">Features a modern and intuitive design for an enhanced user experience.</p>

  <h2 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">Installation</h2>
    <p style="margin-bottom: 20px;">Follow these steps to run the project locally:</p>

  <h3 style="color: #222; font-size: 1.4em; margin-bottom: 10px;">Prerequisites</h3>
    <ul style="padding-left: 20px; margin-bottom: 20px;">
        <li>Install Flutter (<a href="https://flutter.dev/docs/get-started/install" style="color: #007acc; text-decoration: none;">Get Started with Flutter</a>).</li>
        <li>Set up a Firebase project with Firestore and Authentication enabled (<a href="https://firebase.google.com/docs/flutter/setup" style="color: #007acc; text-decoration: none;">Firebase Setup Guide</a>).</li>
        <li>Create a Stripe account and get API keys (<a href="https://stripe.com/docs" style="color: #007acc; text-decoration: none;">Stripe Documentation</a>).</li>
    </ul>

  <h3 style="color: #222; font-size: 1.4em; margin-bottom: 10px;">Steps</h3>
    <ol style="padding-left: 20px; margin-bottom: 20px;">
        <li>Clone the repository:
            <pre style="background-color: #eee; padding: 10px; border-radius: 5px; font-family: 'Courier New', monospace; margin-bottom: 10px;">git clone https://github.com/Akhilaanil104/rentcar.git
cd rentcar</pre>
        </li>
        <li>Install dependencies:
            <pre style="background-color: #eee; padding: 10px; border-radius: 5px; font-family: 'Courier New', monospace; margin-bottom: 10px;">flutter pub get</pre>
        </li>
        <li>Set up Firebase:
            <ul style="padding-left: 20px; margin-bottom: 20px;">
                <li>Add <code style="background-color: #eee; padding: 2px 5px; border-radius: 5px;">google-services.json</code> (Android) or <code style="background-color: #eee; padding: 2px 5px; border-radius: 5px;">GoogleService-Info.plist</code> (iOS).</li>
                <li>Update Firebase configurations in <code style="background-color: #eee; padding: 2px 5px; border-radius: 5px;">main.dart</code>.</li>
            </ul>
        </li>
        <li>Configure Stripe by adding API keys.</li>
        <li>Run the app:
            <pre style="background-color: #eee; padding: 10px; border-radius: 5px; font-family: 'Courier New', monospace;">flutter run</pre>
        </li>
    </ol>

   <h2 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">Project Structure</h2>
    <pre style="background-color: #eee; padding: 10px; border-radius: 5px; font-family: 'Courier New', monospace;">lib/
├── main.dart            # Entry point of the app
├── screens/             # UI screens (e.g., HomePage, CarDetailsPage)
├── widgets/             # Reusable UI components
├── services/            # Firebase and Stripe integrations
├── models/              # Data models for cars and users
└── blocs/               # State management (Bloc)</pre>

  <h2 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">Screenshots</h2>
  <p style="margin-bottom: 20px;">Below is an example screenshot from the app:</p>
<img src="assets/images/cars.jpeg" alt="App Screenshot" style="max-width: 100%; border: 1px solid #ddd; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 20px;">

   <h2 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">Contributing</h2>
    <p style="margin-bottom: 20px;">Contributions are welcome! Feel free to open issues or submit pull requests to improve the app.</p>
    <h2 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">License</h2>
    <p style="margin-bottom: 20px;">This project is licensed under the MIT License. See the <a href="LICENSE" style="color: #007acc; text-decoration: none;">LICENSE</a> file for details.</p>

   <h2 style="color: #222; font-size: 1.8em; margin-bottom: 15px;">Contact</h2>
    <p style="margin-bottom: 20px;">For inquiries or feedback, reach out:</p>
    <ul style="padding-left: 20px; margin-bottom: 20px;">
        <li><strong>Author:</strong> Akhila Anil</li>
        <li><strong>Email:</strong> (Insert your email here)</li>
    </ul>
    <hr style="border: none; height: 1px; background-color: #ddd;">
    <p style="margin-bottom: 20px;">Feel free to explore and contribute to the project. Happy coding! 🎉</p>
</body>
</html>
