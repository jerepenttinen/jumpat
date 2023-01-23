import { MaterialIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import React, { useEffect, useState } from "react";
import { TouchableOpacity, StyleSheet } from "react-native";
import { Surface, Card, FAB, IconButton, Text } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import { useDataSource } from "../data/datasource";
import { WorkoutModel } from "../data/entities/WorkoutModel";
import { StackParamList } from "../navigation/Navigator";

function WorkoutCard({ workout }: { workout: WorkoutModel }) {
  return (
    <Card style={{ marginBottom: 10 }}>
      <Card.Title
        title={
          <Text variant="titleMedium">{workout.createdAt.toDateString()}</Text>
        }
        right={(props) => (
          <IconButton
            {...props}
            icon={(props) => <MaterialIcons {...props} name="more-vert" />}
            onPress={() => {}}
          />
        )}
      />
      <Card.Content>
        {workout.sets?.map((set) => (
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
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        {workouts?.map((workout) => (
          <WorkoutCard key={workout.id} workout={workout} />
        ))}
      </Surface>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const workout = await workoutRepository.create();
          navigation.navigate("EditWorkout", { workoutId: workout.id });
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
