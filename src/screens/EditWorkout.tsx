import { MaterialCommunityIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { FlatList, SafeAreaView, StyleSheet } from "react-native";
import {
  ActivityIndicator,
  Appbar,
  FAB,
  IconButton,
  List,
  Surface,
} from "react-native-paper";

import { Set } from "../data/entities/Set";
import { useCreateSet } from "../hooks/sets";
import { useWorkout } from "../hooks/workouts";
import { StackParamList } from "../navigation/Navigator";

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

function ExerciseListItem({
  set,
  navigation,
}: { set: Set } & Pick<
  NativeStackScreenProps<StackParamList, "EditWorkout">,
  "navigation"
>) {
  return (
    <List.Item
      title={set.exercise?.name}
      right={(props) => (
        <IconButton
          {...props}
          icon="pencil-outline"
          onPress={() => {
            navigation.navigate("EditExercise", {
              workoutId: set.workout.id,
              setId: set.id,
            });
          }}
        />
      )}
    />
  );
}

function CreateSetFAB({
  workoutId,
  action,
}: {
  workoutId: number;
  action: (workoutId: number, setId: number) => void;
}) {
  const createSetMutation = useCreateSet();
  return (
    <FAB
      icon="plus"
      style={styles.fab}
      onPress={() => {
        createSetMutation
          .mutateAsync(workoutId)
          .then((set) => action(workoutId, set.id));
      }}
    />
  );
}

export default function EditWorkout({ navigation, route }: ScreenProps) {
  const workout = useWorkout(route.params.workoutId);

  if (workout.isLoading) {
    return <ActivityIndicator />;
  }

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={workout.data?.sets}
          renderItem={({ item }) => (
            <ExerciseListItem set={item} navigation={navigation} />
          )}
        />
      </Surface>
      <CreateSetFAB
        workoutId={route.params.workoutId}
        action={(workoutId, setId) => {
          navigation.navigate("EditExercise", { workoutId, setId });
        }}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  fab: {
    position: "absolute",
    margin: 16,
    right: 0,
    bottom: 0,
  },
});
