import React, { useEffect } from 'react';
import { View, Text, StyleSheet, Linking } from 'react-native';
import TurboDeeplink from 'turbo-deeplink';

const App = () => {
  useEffect(() => {
    // Initialize deeplink handling
    const subscription = TurboDeeplink.addListener((url) => {
      console.log('Deeplink received:', url);
      // Handle the deeplink here
    });

    // Check for initial deeplink
    TurboDeeplink.getInitialURL().then((url) => {
      if (url) {
        console.log('Initial URL:', url);
        // Handle the initial deeplink
      }
    });

    return () => {
      // Cleanup listener when component unmounts
      subscription.remove();
    };
  }, []);

  // Example function to test deeplink setup
  const testDeeplink = async () => {
    try {
      const supported = await Linking.canOpenURL('yourapp://example');
      if (supported) {
        await Linking.openURL('yourapp://example');
      } else {
        console.log('Deeplink schema not supported');
      }
    } catch (error) {
      console.error('Error opening URL:', error);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Turbo Deeplink Example</Text>
      <Text style={styles.description}>
        This example demonstrates how to use the turbo-deeplink module to handle deep links in your React Native app.
      </Text>
      <Text style={styles.instruction}>
        Configure your app to handle deeplinks with the schema "yourapp://"
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  description: {
    fontSize: 16,
    textAlign: 'center',
    marginBottom: 20,
  },
  instruction: {
    fontSize: 14,
    textAlign: 'center',
    color: '#666',
  },
});

export default App;
