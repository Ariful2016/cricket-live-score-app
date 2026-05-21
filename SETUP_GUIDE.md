# Setup Guide - Cricket Live Score App

Complete step-by-step guide to setup and run the Cricket Live Score App.

## Prerequisites

1. **Flutter SDK** - Download from [flutter.dev](https://flutter.dev)
2. **Android Studio** or **Xcode** (for iOS)
3. **Firebase Account** - Create at [firebase.google.com](https://firebase.google.com)
4. **GitHub Account** (optional, for cloning)

## Step 1: Clone or Download Project

```bash
# Clone the repository
git clone https://github.com/Ariful2016/cricket-live-score-app.git
cd cricket-live-score-app
```

Or download the ZIP file and extract it.

## Step 2: Install Flutter Dependencies

```bash
# Get all dependencies
flutter pub get

# Upgrade packages (optional)
flutter pub upgrade
```

## Step 3: Setup Firebase Project

### 3.1 Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Create a new project"
3. Enter project name: `cricket-live-score`
4. Accept terms and create project

### 3.2 Enable Realtime Database

1. In Firebase Console, go to **Build** → **Realtime Database**
2. Click **Create Database**
3. Choose location and start in **test mode** (for development)
4. Copy the database URL (format: `https://your-project.firebaseio.com`)

### 3.3 Configure Android

1. Go to **Project Settings** → **Your Apps**
2. Click **Android** to add Android app
3. Package name: `com.example.cricket_live_score`
4. Download `google-services.json`
5. Place in `android/app/` directory

### 3.4 Configure iOS (if developing for iOS)

1. Go to **Project Settings** → **Your Apps**
2. Click **iOS** to add iOS app
3. Bundle ID: `com.example.cricketLiveScore`
4. Download `GoogleService-Info.plist`
5. Place in `ios/Runner/` directory

### 3.5 Update firebase_options.dart

1. Run FlutterFire CLI (easiest method):
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Or manually update `lib/firebase_options.dart`:
- Replace `YOUR_API_KEY` with your API key from Firebase Console
- Replace `YOUR_PROJECT_ID` with your project ID
- Replace `YOUR_DATABASE_URL` with your Realtime Database URL

## Step 4: Configure Database Rules

1. In Firebase Console → **Realtime Database** → **Rules**
2. Replace with the following:

```json
{
  "rules": {
    "matches": {
      ".read": true,
      ".write": true
    },
    "teams": {
      ".read": true,
      ".write": true
    },
    "players": {
      ".read": true,
      ".write": true
    },
    "innings": {
      ".read": true,
      ".write": true
    },
    "balls": {
      ".read": true,
      ".write": true
    }
  }
}
```

3. Click **Publish**

## Step 5: Run the App

### For Android:

```bash
# Build and run on connected device/emulator
flutter run

# Or specify device
flutter devices
flutter run -d <device-id>
```

### For iOS:

```bash
# Build and run on simulator/device
flutter run

# Or for release
flutter run --release
```

### For Web (if configured):

```bash
flutter run -d chrome
```

## Step 6: Verify Installation

1. App should start with splash screen
2. Navigate to Home screen
3. Try creating a new match:
   - Fill in match details
   - Add teams and players
   - Click "Create Match"
4. Check Firebase Console to verify data is being saved

## Troubleshooting

### Build Issues

**Error: `google-services.json not found`**
- Ensure `google-services.json` is in `android/app/` directory
- Run `flutter clean` and `flutter pub get`

**Error: `Unable to find gradle`**
```bash
flutter clean
flutter pub get
flutter run
```

### Firebase Issues

**Error: `Permission denied` when writing to database**
- Go to Firebase Console → Realtime Database → Rules
- Make sure rules allow read/write (currently in test mode)
- Click Publish

**Error: `Project ID not found`**
- Run `flutterfire configure` again
- Select correct Firebase project

### App Runtime Issues

**Error: `No matches returned`**
- This is normal on first run
- Create a new match to test functionality

**Error: `Real-time updates not working`**
- Check internet connection
- Verify Firebase connection in Firebase Console
- Check app logs: `flutter run --verbose`

## Development Tips

### Hot Reload
```bash
# While app is running, press 'r'
r     - Hot reload
R     - Hot restart
```

### View Logs
```bash
flutter logs
```

### Debug Mode
```bash
flutter run --debug
flutter run --verbose
```

### Release Build
```bash
flutter build apk          # Android APK
flutter build appbundle    # Android App Bundle
flutter build ios          # iOS
```

## API Reference

### Create a Match

```dart
await matchController.createMatch(
  matchName: 'T20 Final',
  matchType: 'T20',
  totalOvers: 20,
  teamA: teamAModel,
  teamB: teamBModel,
  groundName: 'Eden Gardens',
  matchDate: DateTime.now(),
);
```

### Add a Player

```dart
await teamController.addPlayerToTeam(
  teamId: 'team_id',
  PlayerModel(
    id: 'player_id',
    name: 'Player Name',
    role: 'Batsman',
    jerseyNumber: '7',
  ),
);
```

### Record a Score

```dart
await scoreController.addFour(
  inningsId: 'innings_id',
  striker: 'strikerName',
  bowler: 'bowlerName',
);
```

## Database Schema

### Matches
```
matches/
  ├── matchId
  │   ├── id
  │   ├── matchName
  │   ├── matchType
  │   ├── totalOvers
  │   ├── teamA
  │   ├── teamB
  │   ├── status
  │   └── groundName
```

### Teams
```
teams/
  ├── teamId
  │   ├── id
  │   ├── name
  │   ├── shortName
  │   ├── totalRuns
  │   ├── totalWickets
  │   └── players[]
```

### Players
```
players/
  ├── playerId
  │   ├── id
  │   ├── name
  │   ├── role
  │   ├── jerseyNumber
  │   ├── runs
  │   ├── balls
  │   └── ...stats
```

## Next Steps

1. **Customize theme** - Edit `lib/app/theme/app_theme.dart`
2. **Add authentication** - Implement Firebase Auth
3. **Add storage** - For player images using Firebase Storage
4. **Deploy** - Build release APK and deploy to Play Store

## Support

For issues and questions:
1. Check troubleshooting section above
2. Review [Flutter Documentation](https://flutter.dev/docs)
3. Check [Firebase Documentation](https://firebase.google.com/docs)
4. Open issue on [GitHub](https://github.com/Ariful2016/cricket-live-score-app/issues)

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [GetX Documentation](https://github.com/jonataslaw/getx/wiki)
- [Firebase Realtime Database](https://firebase.google.com/docs/database)

---

Happy coding! 🏏
