import { MaterialCommunityIcons } from "@expo/vector-icons";
import { createMaterialBottomTabNavigator } from "@react-navigation/material-bottom-tabs";
import { NavigationContainer } from "@react-navigation/native";
import { Provider as PaperProvider } from "react-native-paper";
import { SafeAreaProvider } from "react-native-safe-area-context";

import Main from "./Main";
import Other from "./Other";
import { DataSourceContextProvider } from "./data/datasource";

const Tab = createMaterialBottomTabNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <PaperProvider>
        <DataSourceContextProvider>
          <NavigationContainer>
            <Tab.Navigator>
              <Tab.Screen
                name="Main"
                component={Main}
                options={{
                  tabBarIcon: ({ color }) => (
                    <MaterialCommunityIcons
                      name="home"
                      color={color}
                      size={24}
                    />
                  ),
                }}
              />
              <Tab.Screen
                name="Other"
                component={Other}
                options={{
                  tabBarIcon: ({ color }) => (
                    <MaterialCommunityIcons
                      name="library"
                      color={color}
                      size={24}
                    />
                  ),
                }}
              />
            </Tab.Navigator>
          </NavigationContainer>
        </DataSourceContextProvider>
      </PaperProvider>
    </SafeAreaProvider>
  );
}
