import withObservables from "@nozbe/with-observables";
import { NavigationProp, useNavigation } from "@react-navigation/native";
import React, { useCallback, useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { TouchableOpacity, StyleSheet } from "react-native";
import { FlatList } from "react-native-gesture-handler";
import { Surface, Card, FAB, IconButton, Text, Menu } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import WorkoutsController, {
  workouts,
} from "~/data/controllers/WorkoutsController";
import Set from "~/data/models/Set";
import Workout from "~/data/models/Workout";
import { useAppLocale } from "~/presentation/locales/locale";
import { StackParamList } from "~/presentation/navigation/Navigator";
import FormatSet from "~/presentation/util/formatSet";

type WorkoutCardProps = {
  workout: Workout;
  sets: Set[];
};

function WorkoutCard({ workout, sets }: WorkoutCardProps) {
  const { t } = useTranslation(["Workouts"]);
  const { formatDate } = useAppLocale();

  const navigation = useNavigation<NavigationProp<StackParamList>>();

  const [visible, setVisible] = useState(false);

  const openMenu = useCallback(() => setVisible(true), []);
  const closeMenu = useCallback(() => setVisible(false), []);

  return (
    <Card style={{ marginBottom: 10, marginHorizontal: 10 }}>
      <Card.Title
        title={
          <Text variant="titleMedium">{formatDate(workout.createdAt)}</Text>
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
              title={t("Workouts:edit")}
            />
            <Menu.Item
              leadingIcon="trash-can-outline"
              onPress={() => {
                // deleteWorkout.mutate(workout.id);
              }}
              title={t("Workouts:delete")}
            />
          </Menu>
        )}
      />
      <Card.Content>
        {sets.map((set) => (
          <TouchableOpacity key={set.id}>
            <FormatSet set={set} />
          </TouchableOpacity>
        ))}
      </Card.Content>
    </Card>
  );
}

const EnhancedWorkoutCard = withObservables(["workout"], ({ workout }) => ({
  workout,
  sets: workout.sets,
}))(WorkoutCard);

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
            <EnhancedWorkoutCard key={item.id} workout={item} />
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
