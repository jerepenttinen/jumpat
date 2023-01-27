import { NativeStackScreenProps } from "@react-navigation/native-stack";
import React, { useCallback, useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { TouchableOpacity, StyleSheet } from "react-native";
import { FlatList } from "react-native-gesture-handler";
import {
  Surface,
  Card,
  FAB,
  IconButton,
  Text,
  Menu,
  ActivityIndicator,
} from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import { Workout } from "../data/entities/Workout";
import {
  useCreateWorkout,
  useDeleteWorkout,
  useWorkouts,
} from "../hooks/workouts";
import { StackParamList } from "../navigation/Navigator";

type ScreenProps = NativeStackScreenProps<StackParamList, "Workouts">;

function WorkoutCard({
  workout,
  navigation,
}: { workout: Workout } & Pick<ScreenProps, "navigation">) {
  const deleteWorkout = useDeleteWorkout();

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
                deleteWorkout.mutate(workout.id);
              }}
              title="Poista"
            />
          </Menu>
        )}
      />
      <Card.Content>
        {workout.sets?.map((set) => (
          <TouchableOpacity key={set.id}>
            <Text>
              {set.exercise?.name} {set.weight}{" "}
              {set.repetitions?.map((rep) => rep.count).join(" ")}
            </Text>
          </TouchableOpacity>
        ))}
      </Card.Content>
    </Card>
  );
}

export default function Workouts({ navigation }: ScreenProps) {
  const workouts = useWorkouts();
  const createWorkoutMutation = useCreateWorkout();

  const { t } = useTranslation(["Workouts"]);

  useEffect(() => {
    navigation.setOptions({ title: t("Workouts:title")! });
  }, []);

  if (workouts.isLoading) {
    return <ActivityIndicator />;
  }

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={workouts.data}
          inverted
          renderItem={({ item }) => (
            <WorkoutCard key={item.id} workout={item} navigation={navigation} />
          )}
        />
      </Surface>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const workout = await createWorkoutMutation.mutateAsync();
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
