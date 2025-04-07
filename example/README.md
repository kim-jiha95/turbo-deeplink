# Turbo Deeplink Example

This example demonstrates how to use the turbo-deeplink module to handle deep links in your React Native app.

## Getting Started

### Installation

```bash
# Install dependencies
npm install

# Install iOS pods
npx pod-install
```

### Running the app

```bash
# Start Metro bundler
npm start

# Run on iOS
npm run ios

# Run on Android
npm run android
```

## Configuration

### iOS

Update your `Info.plist` to handle your deeplink schema:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>yourapp</string>
    </array>
  </dict>
</array>
```

### Android

Update your `AndroidManifest.xml` to handle your deeplink schema:

```xml
<intent-filter>
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="yourapp" />
</intent-filter>
```

## Usage

Test your deep link by opening:

```
yourapp://example
```
