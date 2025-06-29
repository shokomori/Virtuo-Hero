# VirtuoHero

VirtuoHero is a mobile platform that utilizes AI to transform how Filipino freelancers and students grow their skills, track their progress, and build career readiness in the global digital economy. It combines behavioral habit-building techniques, personalized learning paths, and expert-like AI feedback to bridge the gap between self-learning and real-world skill application.

> 🚧 **Note:** This is a prototype and still under active development. Several features are not fully functional, and bugs may be present.

---

## 📱 Features

### 🧠 AI Mentor
Submit text or image-based outputs to get structured feedback from the Gemini API. Select a role-specific expert lens—such as UI/UX Designer, Software Engineer, or Finance Expert—and receive personalized insights (strengths and suggestions) to help iterate and improve.

### 🗺️ Custom RoadMap
Get a tailored upskilling journey! During onboarding, users answer a quiz based on their interests, MBTI-style personality, current skill level, and available time. The app then builds a personalized 5–7 step learning roadmap powered by Gemini API.

### ✍️ Daily Scrum
A journaling feature that promotes consistent reflection. Users respond to:
- “What I did”
- “What are my roadblocks”
- “What do I want to learn tomorrow?”

Optional image uploads help visualize their learning journey.

### 🔥 Streak System
A gamified habit tracker. Completing the Daily Scrum increases your streak count. Earn badges and animations at key milestones like 7, 30, and 100 days.

---

## ⚙️ Project Setup

This Flutter application is not yet ready for production. However, to preview the prototype:

1. Download the APK file.
2. Install the app on an Android device.
3. Launch the app and explore the available features.

> ✅ Requirements:
- Android device (APK installation supported)
- Internet connection (for Gemini API features)

---

## 📖 How to Use

1. **Install the App**
   - Download the APK file provided.
   - Transfer it to your Android device.
   - Open the APK and install (make sure to allow installations from unknown sources).

2. **Explore the Features**
   - **Custom RoadMap**
     - On first launch, complete the onboarding quiz about your interests, skill level, personality, and time commitment.
     - View your personalized roadmap presented as a vertical timeline.
   
   - **AI Mentor**
     - Go to the "AI Mentor" tab.
     - Choose your role perspective (e.g., UI/UX Designer, Web Developer).
     - Upload an image or type text input.
     - Press "Get Feedback" to receive strengths and suggestions from the AI.
   
   - **Daily Scrum**
     - Access the Daily Scrum section.
     - Answer the three reflective prompts:
       - What I did today
       - What are my roadblocks
       - What I want to learn tomorrow
     - Optionally upload images to support your entry.

   - **Streak System**
     - Submit your Daily Scrum consistently.
     - Check your current streak on the dashboard.
     - Unlock badges for milestone streaks (7, 30, 100 days).

3. **Prototype Limitations**
   - Some pages may be incomplete or buggy.
   - Backend and local data storage are not yet functional.
   - No login is required yet—data is not saved between sessions.

---

## 📦 Dependencies

- [Flutter](https://flutter.dev/)
- [Gemini API (Google AI Studio)](https://aistudio.google.com/app)
- [Hive](https://pub.dev/packages/hive) (planned for local storage, not yet fully implemented)

---

## 🔐 Authentication

Currently, **no authentication** is implemented. Firebase is planned for future integration.

---

## 🗃️ Backend / Database

No backend is implemented yet. Some components for local storage using **Hive** exist in the code but are not yet functional.

---

## 🎨 Design System

- Based on custom [Figma UI design](https://www.figma.com)
- Color palette: `#000000` (Black), `#FFFFFF` (White), `#008080` (Teal)

---

## 🚀 Deployment

Not yet deployed. This prototype is in development and not available on app stores or public distribution platforms.

---

## 👥 Team

| Name | Role |
|------|------|
| **Masato Martin** | Project Manager, UI/UX Lead |
| **John Reshley Gonzales** | Co-Project Manager, AI Prompt Engineer, Front-End Programmer |
| **Keith Ryan Almanzor** | Front-End Programmer, UI Character Designer |
| **Nikko S. Parungao** | Front-End Programmer, Video Editor |
| **Grant Mihkael Quilantang** | Front-End Programmer, Video Scriptwriter |
| **Randel Angelo Yumul** | Full-Stack Programmer |

---

## 📝 Current Status & Notes

- Roadmap feature is still under development
- AI Mentor is functional but may return errors or unrefined outputs
- UI polish and bug fixes are ongoing
- No authentication or persistent storage yet

---

## 📄 License

This project currently does not use a specific open-source license. All rights reserved to the VirtuoHero development team.

---

## 🤖 AI Assistance Disclaimer

> ChatGPT and Gemini API were utilized to assist in the research, content generation, and prototype refinement. All core ideas and designs belong to the development team. AI support was used to speed up iterations and enhance technical feedback.

---
