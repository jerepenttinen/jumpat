import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useEffect, useState } from "react";
import { TouchableOpacity, StyleSheet } from "react-native";
import { Surface, Card, Portal, FAB } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import { useDataSource } from "../data/datasource";
import { WorkoutModel } from "../data/entities/WorkoutModel";
import { StackParamList } from "../navigation/Navigator";

function WorkoutCard({ workout }: { workout: WorkoutModel }) {
  return (
    <Card>
      <Card.Title title={workout.createdAt.toDateString()} />
      <Card.Content>
        {workout.sets.map((set) => (
          <TouchableOpacity>
            {set.exercise.name} {set.weight}{" "}
            {set.repetitions.map((rep) => rep.count).join(" ")}
          </TouchableOpacity>
        ))}
      </Card.Content>
    </Card>
  );
}

export default function Workouts({
  navigation,
}: NativeStackScreenProps<StackParamList, "Workouts">) {
  const { workoutRepository } = useDataSource();

  const [workouts, setWorkouts] = useState<WorkoutModel[]>([]);

  useEffect(() => {
    workoutRepository.getAll().then(setWorkouts);
  }, []);

  return (
    <SafeAreaView style={{ height: "100%" }}>
      <Portal.Host>
        <FAB
          icon="plus"
          style={styles.fab}
          onPress={() => navigation.navigate("EditWorkout")}
        />
      </Portal.Host>
      <Surface>
        {workouts.map((workout) => (
          <WorkoutCard key={workout.id} workout={workout} />
        ))}
      </Surface>
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
