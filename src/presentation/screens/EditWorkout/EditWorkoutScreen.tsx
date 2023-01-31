import { MaterialCommunityIcons } from "@expo/vector-icons";
import withObservables from "@nozbe/with-observables";
import {
  NavigationProp,
  RouteProp,
  useFocusEffect,
  useNavigation,
  useRoute,
} from "@react-navigation/native";
import { useCallback } from "react";
import { SafeAreaView } from "react-native";
import { Appbar } from "react-native-paper";
import { compose } from "recompose";

import CreateSetFAB from "./components/CreateSetFAB";
import ExerciseList from "./components/ExerciseList";

import { workouts } from "~/data/controllers/WorkoutsController";
import Set from "~/data/models/Set";
import Workout from "~/data/models/Workout";
import { useAppLocale } from "~/presentation/locales/locale";
import { StackParamList } from "~/presentation/navigation/Navigator";

export function EditWorkoutHeader() {
  return (
    <Appbar.Action
      icon={({ color, size }) => (
        <MaterialCommunityIcons name="calendar" color={color} size={size} />
      )}
      onPress={() => {
        //TODO
        console.log("TODO");
      }}
    />
  );
}

type Props = {
  workout: Workout;
  sets: Set[];
};

function EditWorkoutScreen({ workout, sets }: Props) {
  const { formatDate } = useAppLocale();

  useFocusEffect(
    useCallback(() => {
      navigation.setOptions({
        title: formatDate(workout.createdAt),
      });
    }, [workout]),
  );

  const route = useRoute<RouteProp<StackParamList, "EditWorkout">>();
  const navigation = useNavigation<NavigationProp<StackParamList>>();

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <ExerciseList sets={sets} />
      <CreateSetFAB
        workoutId={route.params.workoutId}
        action={(setId) => {
          navigation.navigate("EditExercise", { setId });
        }}
      />
    </SafeAreaView>
  );
}

const enhance = compose(
  withObservables(["route"], ({ route }) => ({
    workout: workouts.findAndObserve(route.params.workoutId),
  })),
  withObservables(["workout"], ({ workout }) => ({
    sets: workout.sets.observe(),
  })),
);

export default enhance(EditWorkoutScreen);
