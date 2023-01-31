import {
  NativeStackHeaderProps,
  createNativeStackNavigator,
} from "@react-navigation/native-stack";
import { HeaderButtonProps } from "@react-navigation/native-stack/lib/typescript/src/types";
import { useTranslation } from "react-i18next";
import { Appbar } from "react-native-paper";

import EditExercise, {
  EditExerciseHeader,
} from "~/presentation/screens/EditExercise/EditExerciseScreen";
import EditWorkoutScreen, {
  EditWorkoutHeader,
} from "~/presentation/screens/EditWorkout/EditWorkoutScreen";
import WorkoutsScreen from "~/presentation/screens/Workouts/WorkoutsScreen";

export type StackParamList = {
  Workouts: undefined;
  EditWorkout: { workoutId: string };
  EditExercise: { setId: string };
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
  const { t } = useTranslation(["Workouts"]);

  return (
    <Stack.Navigator
      initialRouteName="Workouts"
      screenOptions={{
        header: (props) => <CustomNavigationBar {...props} />,
      }}
    >
      <Stack.Screen
        name="Workouts"
        component={WorkoutsScreen}
        options={{ title: t("Workouts:title")! }}
      />
      <Stack.Screen
        name="EditWorkout"
        component={EditWorkoutScreen}
        options={{
          title: "Maanantai 23.1.2023",
          headerRight: () => <EditWorkoutHeader />,
        }}
      />
      <Stack.Screen
        name="EditExercise"
        component={EditExercise}
        options={{
          title: "Muokkaa",
          headerRight: () => <EditExerciseHeader />,
        }}
      />
    </Stack.Navigator>
  );
}
