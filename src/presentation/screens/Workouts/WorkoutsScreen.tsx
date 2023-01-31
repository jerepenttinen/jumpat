import withObservables from "@nozbe/with-observables";
import { NavigationProp, useNavigation } from "@react-navigation/native";
import React, { useEffect } from "react";
import { useTranslation } from "react-i18next";
import { StyleSheet } from "react-native";
import { FlatList } from "react-native-gesture-handler";
import { Surface, FAB } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import WorkoutCard from "./components/WorkoutCard";

import WorkoutsController, {
  workouts,
} from "~/data/controllers/WorkoutsController";
import Workout from "~/data/models/Workout";
import { StackParamList } from "~/presentation/navigation/Navigator";

type Props = {
  workouts: Workout[];
};

function Workouts({ workouts }: Props) {
  const navigation = useNavigation<NavigationProp<StackParamList>>();

  const { t } = useTranslation(["Workouts"]);

  useEffect(() => {
    navigation.setOptions({ title: t("Workouts:title")! });
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={workouts}
          inverted
          renderItem={({ item }) => (
            <WorkoutCard key={item.id} workout={item} />
          )}
        />
      </Surface>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const workout = await WorkoutsController.create();
          navigation.navigate("EditWorkout", { workoutId: workout.id });
        }}
      />
    </SafeAreaView>
  );
}

const enhance = withObservables([], () => ({
  workouts: workouts.query().observe(),
}));
export default enhance(Workouts);

const styles = StyleSheet.create({
  fab: {
    position: "absolute",
    margin: 16,
    right: 0,
    bottom: 0,
  },
});
