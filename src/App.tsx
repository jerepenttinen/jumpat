import "./locales";
import "./data";
import {
  NavigationContainer,
  DefaultTheme as NavigationLightTheme,
} from "@react-navigation/native";
import {
  MD3LightTheme,
  Provider as PaperProvider,
  adaptNavigationTheme,
} from "react-native-paper";
import { SafeAreaProvider } from "react-native-safe-area-context";

import { AppLocaleProvider } from "./locales/locale";
import Navigator from "./navigation/Navigator";

export default function App() {
  const { LightTheme } = adaptNavigationTheme({
    reactNavigationLight: NavigationLightTheme,
  });
  return (
    <SafeAreaProvider>
      <PaperProvider theme={MD3LightTheme}>
        <NavigationContainer theme={LightTheme}>
          <AppLocaleProvider>
            <Navigator />
          </AppLocaleProvider>
        </NavigationContainer>
      </PaperProvider>
    </SafeAreaProvider>
  );
}
