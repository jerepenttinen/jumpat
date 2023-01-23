import { NativeStackScreenProps } from "@react-navigation/native-stack";
import React, { useCallback, useEffect, useState } from "react";
import { TouchableOpacity, StyleSheet } from "react-native";
import { FlatList } from "react-native-gesture-handler";
import { Surface, Card, FAB, IconButton, Text, Menu } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import { useDataSource } from "../data/datasource";
import { WorkoutModel } from "../data/entities/WorkoutModel";
import { StackParamList } from "../navigation/Navigator";

function WorkoutCard({
  workout,
  navigation,
  deleteWorkout,
}: { workout: WorkoutModel; deleteWorkout: (id: number) => void } & Pick<
  NativeStackScreenProps<StackParamList, "Workouts">,
  "navigation"
>) {
  const [visible, setVisible] = useState(false);

  const openMenu = useCallback(() => setVisible(true), []);
  const closeMenu = useCallback(() => setVisible(false), []);

  return (
    <Card style={{ marginBottom: 10, marginHorizontal: 10 }}>
      <Card.Title
        title={
          <Text variant="titleMedium">
            {workout.createdAt?.toDateString()} {workout.id}
          </Text>
        }
        right={(props) => (
          <Menu
            visible={visible}
            onDismiss={closeMenu}
            anchor={
              <IconButton {...props} icon="dots-vertical" onPress={openMenu} />
            }
          >
            <Menu.Item
              leadingIcon="pencil-outline"
              onPress={() => {
                closeMenu();
                navigation.navigate("EditWorkout", { workoutId: workout.id });
              }}
              title="Muokkaa"
            />
            <Menu.Item
              leadingIcon="trash-can-outline"
              onPress={() => {
                deleteWorkout(workout.id);
              }}
              title="Poista"
            />
          </Menu>
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

  const deleteWorkout = useCallback((workoutId: number) => {
    workoutRepository.delete(workoutId).then(() => {
      setWorkouts((last) => last.filter((workout) => workout.id !== workoutId));
    });
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={workouts}
          inverted
          renderItem={({ item }) => (
            <WorkoutCard
              workout={item}
              navigation={navigation}
              deleteWorkout={deleteWorkout}
            />
          )}
        />
      </Surface>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const workout = await workoutRepository.create();
          navigation.navigate("EditWorkout", { workoutId: workout.id });
          setWorkouts((last) => [...last, workout]);
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
