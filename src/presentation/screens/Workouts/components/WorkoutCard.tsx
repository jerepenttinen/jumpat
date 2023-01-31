import withObservables from "@nozbe/with-observables";
import { NavigationProp, useNavigation } from "@react-navigation/native";
import { useState, useCallback } from "react";
import { useTranslation } from "react-i18next";
import { TouchableOpacity } from "react-native";
import { Card, Menu, IconButton, Text } from "react-native-paper";

import Set from "~/data/models/Set";
import Workout from "~/data/models/Workout";
import FormattedSet from "~/presentation/components/FormattedSet";
import { useAppLocale } from "~/presentation/locales/locale";
import { StackParamList } from "~/presentation/navigation/Navigator";

type Props = {
  workout: Workout;
  sets: Set[];
};

function WorkoutCard({ workout, sets }: Props) {
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
            <FormattedSet set={set} />
            {/* <FormatSet set={set} /> */}
          </TouchableOpacity>
        ))}
      </Card.Content>
    </Card>
  );
}

const enhance = withObservables(["workout"], ({ workout }) => ({
  workout,
  sets: workout.sets,
}));

export default enhance(WorkoutCard);
