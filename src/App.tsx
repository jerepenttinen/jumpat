import "./locales";
import "./data";
import {
  NavigationContainer,
  DefaultTheme as NavigationLightTheme,
} from "@react-navigation/native";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import {
  MD3LightTheme,
  Provider as PaperProvider,
  adaptNavigationTheme,
} from "react-native-paper";
import { SafeAreaProvider } from "react-native-safe-area-context";

import { DataSourceContextProvider } from "./data/datasource";
import { AppLocaleProvider } from "./locales/locale";
import Navigator from "./navigation/Navigator";

const queryClient = new QueryClient();

export default function App() {
  const { LightTheme } = adaptNavigationTheme({
    reactNavigationLight: NavigationLightTheme,
  });
  return (
    <SafeAreaProvider>
      <PaperProvider theme={MD3LightTheme}>
        <DataSourceContextProvider>
          <QueryClientProvider client={queryClient}>
            <NavigationContainer theme={LightTheme}>
              <AppLocaleProvider>
                <Navigator />
              </AppLocaleProvider>
            </NavigationContainer>
          </QueryClientProvider>
        </DataSourceContextProvider>
      </PaperProvider>
    </SafeAreaProvider>
  );
}
