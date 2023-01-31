import "~/presentation/locales";
import "~/data";
import { NavigationContainer } from "@react-navigation/native";
import { Provider as PaperProvider } from "react-native-paper";
import { SafeAreaProvider } from "react-native-safe-area-context";

import usePaperTheme from "./presentation/hooks/usePaperTheme";

import { AppLocaleProvider } from "~/presentation/locales/locale";
import Navigator from "~/presentation/navigation/Navigator";

export default function App() {
  const [paperTheme, navigationTheme] = usePaperTheme();

  return (
    <SafeAreaProvider>
      <PaperProvider theme={paperTheme}>
        <NavigationContainer theme={navigationTheme}>
          <AppLocaleProvider>
            <Navigator />
          </AppLocaleProvider>
        </NavigationContainer>
      </PaperProvider>
    </SafeAreaProvider>
  );
}
