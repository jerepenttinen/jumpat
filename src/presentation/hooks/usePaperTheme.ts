import {
  DefaultTheme as NavigationLightTheme,
  DarkTheme as NavigationDarkTheme,
} from "@react-navigation/native";
import { useColorScheme } from "react-native";
import {
  MD3LightTheme,
  MD3DarkTheme,
  MD3Theme,
  adaptNavigationTheme,
} from "react-native-paper";
import { NavigationTheme } from "react-native-paper/lib/typescript/types";

export default function usePaperTheme(): [MD3Theme, NavigationTheme] {
  const colorScheme = useColorScheme();

  const { LightTheme, DarkTheme } = adaptNavigationTheme({
    reactNavigationLight: NavigationLightTheme,
    reactNavigationDark: NavigationDarkTheme,
  });

  if (colorScheme === "dark") {
    return [MD3DarkTheme, DarkTheme];
  } else {
    return [MD3LightTheme, LightTheme];
  }
}
