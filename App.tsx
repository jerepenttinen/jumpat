import { StatusBar } from "expo-status-bar";
import { View, Text } from "react-native-ui-lib";

export default function App() {
  return (
    <View flex paddingH-25 paddingT-120>
      <Text blue50 text20>
        Moi
      </Text>
      <StatusBar style="auto" />
    </View>
  );
}
