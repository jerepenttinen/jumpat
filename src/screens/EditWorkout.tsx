import { MaterialCommunityIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useEffect, useState } from "react";
import { FlatList, SafeAreaView, StyleSheet } from "react-native";
import { Appbar, FAB, Surface, Text } from "react-native-paper";

import { useDataSource } from "../data/datasource";
import { SetModel } from "../data/entities/SetModel";
import { StackParamList } from "../navigation/Navigator";

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

export default function EditWorkout({
  navigation,
  route,
}: NativeStackScreenProps<StackParamList, "EditWorkout">) {
  const { setRepository, workoutRepository } = useDataSource();
  const [sets, setSets] = useState<SetModel[]>([]);

  useEffect(() => {
    workoutRepository.findById(route.params.workoutId).then((workout) => {
      setSets(workout.sets);
      console.log(workout.sets);
    });
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={sets}
          renderItem={({ item }) => <Text>{item.id}</Text>}
        />
      </Surface>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const set = await setRepository.create(route.params.workoutId);
          navigation.navigate("EditExercise", { setId: set.id });
          setSets((last) => [...last, set]);
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
