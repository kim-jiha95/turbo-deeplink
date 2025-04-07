# turbo-deeplink

A React Native TurboModule for handling deep links in your application.

## Installation

```sh
npm install turbo-deeplink
```

or using yarn:

```sh
yarn add turbo-deeplink
```

## Usage

```javascript
import { TurboDeeplink } from 'turbo-deeplink';

// Check if deep linking is supported
const isSupported = await TurboDeeplink.isSupported();

// Check if a URL can be opened
const canOpen = await TurboDeeplink.canOpenURL('https://example.com');

// Open a URL
const opened = await TurboDeeplink.openURL('https://example.com');
```

## API

### isSupported()

Returns a promise that resolves to a boolean indicating whether deep linking is supported on the device.

### canOpenURL(url: string)

Returns a promise that resolves to a boolean indicating whether the specified URL can be opened.

### openURL(url: string)

Opens the specified URL and returns a promise that resolves to a boolean indicating whether the URL was successfully opened.

## License

MIT