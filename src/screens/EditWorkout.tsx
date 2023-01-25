import { MaterialCommunityIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useState } from "react";
import { FlatList, SafeAreaView, StyleSheet } from "react-native";
import { Appbar, FAB, IconButton, List, Surface } from "react-native-paper";

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

function ExerciseListItem({
  set,
  navigation,
}: { set: SetModel } & Pick<
  NativeStackScreenProps<StackParamList, "EditWorkout">,
  "navigation"
>) {
  const { setRepository } = useDataSource();
  return (
    <List.Item
      title={set.exercise?.name}
      right={(props) => (
        <IconButton
          {...props}
          icon="pencil-outline"
          onPress={async () => {
            navigation.navigate("EditExercise", {
              set: await setRepository.findById(set.id),
            });
          }}
        />
      )}
    />
  );
}

export default function EditWorkout({
  navigation,
  route,
}: NativeStackScreenProps<StackParamList, "EditWorkout">) {
  const { setRepository } = useDataSource();
  const [sets, setSets] = useState<SetModel[]>(route.params.workout.sets);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={sets}
          renderItem={({ item }) => (
            <ExerciseListItem set={item} navigation={navigation} />
          )}
        />
      </Surface>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const set = await setRepository.create(route.params.workout.id);
          navigation.navigate("EditExercise", { set });
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
