import { MaterialCommunityIcons } from "@expo/vector-icons";
import withObservables, { ObservableifyProps } from "@nozbe/with-observables";
import {
  NavigationProp,
  RouteProp,
  useFocusEffect,
  useNavigation,
  useRoute,
} from "@react-navigation/native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useEffect, useState } from "react";
import { FlatList, SafeAreaView } from "react-native";
import { Appbar, IconButton, List, Surface } from "react-native-paper";
import { compose } from "recompose";

import { workouts } from "../../data/controllers/WorkoutsController";
import Set from "../../data/models/Set";
import Workout from "../../data/models/Workout";
import { useAppLocale } from "../../locales/locale";
import { StackParamList } from "../../navigation/Navigator";
import formatSet from "../../util/formatSet";
import CreateSetFAB from "./components/CreateSetFAB";

type ScreenProps = NativeStackScreenProps<StackParamList, "EditWorkout">;

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

function ExerciseListItem({ set }: { set: Set }) {
  const [title, setTitle] = useState("");

  useEffect(() => {
    formatSet(set).then(setTitle);
  }, [set]);

  const navigation = useNavigation<NavigationProp<StackParamList>>();

  return (
    <List.Item
      title={title}
      right={(props) => (
        <IconButton
          {...props}
          icon="pencil-outline"
          onPress={() => {
            navigation.navigate("EditExercise", {
              setId: set.id,
            });
          }}
        />
      )}
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
      <Surface elevation={0}>
        <FlatList
          data={sets}
          renderItem={({ item }) => <ExerciseListItem set={item} />}
          contentContainerStyle={{ paddingBottom: 100 }}
        />
      </Surface>
      <CreateSetFAB
        workoutId={route.params.workoutId}
        action={(setId) => {
          navigation.navigate("EditExercise", { setId });
        }}
      />
    </SafeAreaView>
  );
}

type InputProps = ObservableifyProps<Props & ScreenProps, "navigation">;
const enhance = compose(
  withObservables(["route"], ({ route }: InputProps) => ({
    workout: workouts.findAndObserve(route.params.workoutId),
  })),
  withObservables(["workout"], ({ workout }: { workout: Workout }) => ({
    sets: workout.sets.observe(),
  })),
);

export default enhance(EditWorkoutScreen);
