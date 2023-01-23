import {
  NativeStackHeaderProps,
  createNativeStackNavigator,
} from "@react-navigation/native-stack";
import { HeaderButtonProps } from "@react-navigation/native-stack/lib/typescript/src/types";
import { Appbar } from "react-native-paper";

import EditWorkout, { EditWorkoutHeader } from "../screens/EditWorkout";
import Workouts from "../screens/Workouts";

export type StackParamList = {
  Workouts: undefined;
  EditWorkout: undefined;
};

const Stack = createNativeStackNavigator<StackParamList>();

function CustomNavigationBar({
  back,
  navigation,
  options,
}: NativeStackHeaderProps) {
  return (
    <Appbar.Header>
      {back ? <Appbar.BackAction onPress={() => navigation.goBack()} /> : null}
      <Appbar.Content title={options.title} />
      {options.headerRight
        ? options.headerRight({} as HeaderButtonProps)
        : null}
    </Appbar.Header>
  );
}

export default function Navigator() {
  return (
    <Stack.Navigator
      initialRouteName="Workouts"
      screenOptions={{
        header: (props) => <CustomNavigationBar {...props} />,
      }}
    >
      <Stack.Screen
        name="Workouts"
        component={Workouts}
        options={{ title: "Jumpat" }}
      />
      <Stack.Screen
        name="EditWorkout"
        component={EditWorkout}
        options={{
          title: "Maanantai 23.1.2023",
          headerRight: () => <EditWorkoutHeader />,
        }}
      />
    </Stack.Navigator>
  );
}
