# Razorpay Integration in Flutter (BLoC + SOLID Principles)

## Overview
This project demonstrates how to integrate **Razorpay** into a **Flutter** application using the **BLoC** pattern while following **SOLID** principles. It ensures a clean and scalable architecture for handling payments.

## Features
- Razorpay integration for handling payments
- Clean architecture following SOLID principles
- State management using BLoC
- Secure API key management
- Error handling and UI feedback

## Prerequisites
- Flutter SDK installed
- A Razorpay account ([Sign Up](https://razorpay.com/))
- API Keys from Razorpay Dashboard (Test and Live Keys)

## Getting API Keys
1. Go to [Razorpay Dashboard](https://dashboard.razorpay.com/)
2. Navigate to **Settings > API Keys**
3. Click on **Generate Key**
4. Copy the **Key ID** (public) and **Key Secret** (keep it secure)

## Installation
1. Add dependencies in `pubspec.yaml`.
2. Run the following command:
   ```sh
   flutter pub get
   ```

## Implementation Steps
1. **Create Events:** Define events to initiate Razorpay payments.
2. **Create States:** Handle different states like initial, loading, success, and failure.
3. **Implement Repository:** Create a repository to interact with the Razorpay SDK.
4. **Setup BLoC:** Manage the payment logic using BLoC.
5. **Build UI:** Create a user interface to trigger payments and handle responses.

## Razorpay Test Card Details
Use these details for test mode:
- **Card Number**: `4111 1111 1111 1111`
- **Expiry**: Any future date (e.g., `12/26`)
- **CVV**: `123`
- **OTP**: `123456`

## Deployment Checklist
- Switch to **Live API Key** before production.
- Implement **error handling** and **logging**.
- Ensure **secure key storage** (Never expose Secret Key in frontend code).

## Conclusion
This setup ensures:
✅ Clean architecture
✅ SOLID principles
✅ BLoC for state management
✅ Secure payment integration

Let me know if you need modifications! 🚀


