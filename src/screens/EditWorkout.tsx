import { MaterialCommunityIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { SafeAreaView, StyleSheet } from "react-native";
import { Appbar, FAB } from "react-native-paper";

import { useDataSource } from "../data/datasource";
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
  const { setRepository } = useDataSource();

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const set = await setRepository.create(route.params.workoutId);
          navigation.navigate("EditExercise", { setId: set.id });
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
