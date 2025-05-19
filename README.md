# Citizen Engagement System


A Flutter-based platform powered by AI, enabling citizens to voice their concerns while allowing government departments to respond efficiently and transparently.

* Submitted for: HANGA HUB Hackathon 

# Project Overview

The Citizen Engagement System is a mobile-first solution built to bridge the communication gap between citizens and government agencies.  By leveraging an advanced AI model, users can submit complaints effortlessly—simply typing their concerns, while the model automatically detects and assigns the appropriate ministry. Administrators benefit from an intuitive dashboard to manage submissions, respond promptly, and ensure transparency in issue resolution.

This project was developed within the time constraints of the Hackathon.

# Problem Statement: 

Many citizens face challenges in voicing concerns to government institutions, including:

Lack of a streamlined, transparent system for submitting complaints.

Poor tracking and feedback on submitted issues.

Manual handling of reports by government departments.

# Our Solution
 
We developed an AI-powered mobile application to transform the complaint-handling process:

* Users can submit complaints through a simple interface, with AI automatically identifying the relevant government ministry.

 * Admin View: Enables admins to view categorized complaints, assign statuses, and respond directly to users.

 password for admin auth is password

 The UI is simple, fast, and leverages orange as a primary theme color for clarity and energy.

 # Features
 
  For Citizens (Users):
   
* Submit complaints or feedback with category and description

* Track complaint status (Pending, Resolved, etc.)

* View admin replies

 For Admins:
 
* View complaints filtered by department

* Reply to citizen complaints

* Status management and real-time updates

* Secure logout functionality


🚀 Tech Stack

* Flutter (UI)

* Riverpod (state management)

* Firebase (Auth & Firestore)

* Dio (API calls)

* GoRouter (navigation)

* Google Fonts (typography)

* Material Design with orange as the primary theme color

  # System Architecture
Lib
│── AI
   

│── Authentication

│── Home

│── Model

│── Providers

│── Services

│── Widgets

│── main.dart

## 🛠 Technologies & Packages Used

| Package | Purpose |
|--------|---------|
| [flutter_riverpod](https://pub.dev/packages/riverpod) | State management |
| [go_router](https://pub.dev/packages/go_router) | Navigation and routing |
| [google_fonts](https://pub.dev/packages/google_fonts) | Custom fonts |
| [Firebase Auth](https://pub.dev/packages/firebase_auth) | Firebase Authentication |
| [Cloud Firestore](https://pub.dev/packages/cloud_firestore) | Firebase storage  |


---


## 🛠 Setup Instructions

- Flutter SDK (>= 3.7.2)
- Android Studio or VS Code
- Emulator or physical device

---

## 🚀 Run the App

1. **Clone the repository**
   ```bash
   git clone https://github.com/ChrisKamanzi/CivicLink.git
   cd CivicLink


2 - Install dependencies:

<pre> flutter pub get </pre>

3 - Run the app:

<pre> flutter run  </pre>


##  🌌 ScreenShots

* Authentication
  
Citizen auth 

<img width="396" alt="Screenshot 2025-05-19 at 09 19 09" src="https://github.com/user-attachments/assets/480b8cd8-da5a-447f-96b8-b3935edc10ab" />


<img width="396" alt="Screenshot 2025-05-19 at 09 19 16" src="https://github.com/user-attachments/assets/3a3f8073-e092-4ee8-b2a6-eec8fc5e96ec" />

Admin Auth

<img width="396" alt="Screenshot 2025-05-19 at 09 20 23" src="https://github.com/user-attachments/assets/139210c2-7f25-4dc6-9777-0cd4f625d35d" />

* Citizen Dashboard
  
<img width="396" alt="Screenshot 2025-05-19 at 09 19 40" src="https://github.com/user-attachments/assets/2a64dbf9-50bf-46ce-9a03-e3e74f1ce5c8" />


<img width="396" alt="Screenshot 2025-05-19 at 09 19 51" src="https://github.com/user-attachments/assets/11dfb7ee-d6cd-4502-8f69-b6bbdb01b312" />

<img width="396" alt="Screenshot 2025-05-19 at 09 20 11" src="https://github.com/user-attachments/assets/15d4696f-c4f3-4cca-ab27-456f8d54dad5" />


<img width="396" alt="Screenshot 2025-05-19 at 09 20 03" src="https://github.com/user-attachments/assets/0436782f-247b-4325-b823-ed74751334e3" />




* Administrator Dashboard

*   <img width="396" alt="Screenshot 2025-05-19 at 09 20 46" src="https://github.com/user-attachments/assets/b0bf54f5-9b8a-463f-84cf-88a32efe79ff" />


  <img width="396" alt="Screenshot 2025-05-19 at 09 20 55" src="https://github.com/user-attachments/assets/3331b4e1-25cf-46a2-b91b-e200319b4a9f" />





