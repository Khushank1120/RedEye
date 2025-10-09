# 🚗 NU RedEye — A Smarter, Safer RedEye Extension

**NU SafeRide** is a next-generation extension to Northeastern University’s official **RedEye** service.  
It modernizes and streamlines late-night campus transportation by addressing long-standing issues reported by students — making rides **faster, smarter, and safer**.

---

## 🎯 Project Overview

As part of the **iOS Mobile App Development course**, NU SafeRide was designed to **enhance and extend** the capabilities of the existing **RedEye escort service** offered by Northeastern University.

While RedEye offers safe rides from **Snell Library** to **off-campus residences within a 2-mile radius**, NU SafeRide introduces **modern mobility features**, **real-time tracking**, and **intelligent routing** — transforming the user experience from a static phone-based system into a seamless digital platform.

---

## 🚨 Problems with the Current RedEye Service

Through user research and firsthand experience, several pain points were identified in the existing RedEye service:

- ⏱ **Long wait times** and uncertainty about vehicle arrival  
- ☎️ **Inefficient phone-based request system**  
- 🚫 **No real-time tracking** of assigned vehicles  
- 🧭 **Suboptimal routing** — passengers far away are dropped before nearer ones  
- 🕐 **No queue transparency or alternative options** when vehicles are unavailable  

---

## 💡 NU SafeRide — Key Enhancements

| Problem | NU SafeRide Solution |
|----------|----------------------|
| Long wait times | **Accurate ETA notifications** using live GPS tracking |
| No real-time info | **In-app vehicle tracking** via MapKit |
| Phone-based system | **Modern iOS app interface** for instant ride requests |
| Inefficient routing | **Dynamic, optimized routing algorithm** minimizing travel time |
| No pickup flexibility | **Dynamic pickup suggestions** based on user’s current location |
| No info when unavailable | **Waiting list with push notifications** when vehicles become free |
| Lack of transparency | **Driver and vehicle details** displayed for user security |
| No ride history | **Ride log and favorite locations** for user convenience |

---

## 📲 Core Features

- 📍 **Dynamic Pickup Suggestions**  
  Automatically recommends nearby pickup zones based on your GPS location.

- 🕐 **Waiting List & Notifications**  
  If no vehicles are available, join a waiting list and get a notification when a slot opens.

- 🚘 **Real-Time Vehicle Tracking**  
  Track your assigned RedEye vehicle on a live map in real time.

- ⏱ **Accurate ETA Alerts**  
  Push notifications with real-time estimated pickup times.

- 👤 **Driver & Vehicle Info**  
  Provides verified driver identity and vehicle details for improved safety.

- ⭐ **Favorite Locations & Ride History**  
  Quickly select frequent destinations and review past rides.

---

## ⚙️ Technical Overview

**Tech Stack**
- 🧩 **Frontend:** Swift & SwiftUI  
- 🗺 **Location Services:** Core Location, MapKit  
- ☁️ **Backend:** Firebase (for real-time database, authentication, push notifications)  
- 🔔 **Notifications:** Firebase Cloud Messaging  
- 🧠 **Algorithm:** Custom route optimization logic for smart matching and efficient drop-offs  

*(Architecture and backend may adapt based on evolving project requirements.)*

---

## 🧭 System Flow

1. User opens the app and signs in.  
2. App detects the user’s location and suggests the nearest pickup point.  
3. User submits a ride request via the in-app interface.  
4. Backend matches the request with an available RedEye driver using optimized routing.  
5. User receives driver details, ETA, and live vehicle tracking.  
6. Push notifications update the user about status changes (vehicle assigned, arriving, or delayed).  

---

## 🧑‍💻 Development Goals

- Deliver a **fully functional iOS prototype** with a strong UX/UI foundation.  
- Showcase **real-time updates** using Firebase.  
- Integrate **location services** and **dynamic routing** for an improved ride experience.  
- Demonstrate **end-to-end system design thinking** — from user flow to backend integration.  

---

## 🧠 Learning Outcomes

This project showcases:
- End-to-end **mobile application architecture**
- **Problem-driven design thinking**
- **SwiftUI state management**
- Integration of **Core Location** and **MapKit**
- Real-time synchronization using **Firebase**
- UX principles for **safe and accessible transportation**

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 👨‍🎓 Author

**Khushank Mistry**  
Grad Student, Northeastern University  
🔗 [GitHub Profile](https://github.com/Khushank20)
🔗 [GitHub Profile](https://github.com/Khushank1120)
