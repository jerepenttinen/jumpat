import { MaterialCommunityIcons } from "@expo/vector-icons";
import withObservables from "@nozbe/with-observables";
import {
  NavigationProp,
  RouteProp,
  useFocusEffect,
  useNavigation,
  useRoute,
} from "@react-navigation/native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useState } from "react";
import { FlatList, SafeAreaView, TouchableOpacity } from "react-native";
import {
  ActivityIndicator,
  Appbar,
  Button,
  FAB,
  IconButton,
  List,
  Modal,
  Portal,
  Searchbar,
  Surface,
  Text,
  useTheme,
} from "react-native-paper";
import { compose } from "recompose";

import SetsController from "../../data/controllers/SetsController";
import { workouts } from "../../data/controllers/WorkoutsController";
import Exercise from "../../data/models/Exercise";
import Set from "../../data/models/Set";
import Workout from "../../data/models/Workout";
import { useCreateExercise, useExercises } from "../../hooks/exercises";
import { useCreateSet } from "../../hooks/sets";
import { useWorkout } from "../../hooks/workouts";
import { useAppLocale } from "../../locales/locale";
import { StackParamList } from "../../navigation/Navigator";
import formatSet from "../../util/formatSet";
import CreateSetFAB from "./components/CreateSetFAB";

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
  return (
    <List.Item
      title={set.weight}
      right={(props) => (
        <IconButton
          {...props}
          icon="pencil-outline"
          onPress={() => {
            // navigation.navigate("EditExercise", {
            //   setId: set.id,
            // });
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
  // const workout = useWorkout(route.params.workoutId);
  // const { formatDate } = useAppLocale();

  // useFocusEffect(
  //   useCallback(() => {
  //     navigation.setOptions({
  //       title: formatDate(workout.data?.createdAt!),
  //     });
  //   }, [workout.data]),
  // );

  // if (workout.isLoading) {
  //   return <ActivityIndicator />;
  // }

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

const enhance = compose(
  withObservables(["route"], ({ route }) => ({
    workout: workouts.findAndObserve(route.params.workoutId),
  })),
  withObservables(["workout"], ({ workout }) => ({
    workout,
    sets: workout.sets,
  })),
);

export default enhance(EditWorkoutScreen);
