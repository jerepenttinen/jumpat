import { MaterialCommunityIcons } from "@expo/vector-icons";
import withObservables from "@nozbe/with-observables";
import { Picker } from "@react-native-picker/picker";
import {
  NavigationProp,
  useFocusEffect,
  useNavigation,
} from "@react-navigation/native";
import { useCallback, useEffect, useMemo, useState } from "react";
import { SafeAreaView, StyleSheet, View } from "react-native";
import { Appbar, FAB, TextInput } from "react-native-paper";
import { compose } from "recompose";

import RepetitionsController from "~/data/controllers/RepetitionsController";
import SetsController, { sets } from "~/data/controllers/SetsController";
import Exercise from "~/data/models/Exercise";
import Repetition from "~/data/models/Repetition";
import Set from "~/data/models/Set";
import FormattedSet from "~/presentation/components/FormattedSet";
import { StackParamList } from "~/presentation/navigation/Navigator";

export function EditExerciseHeader() {
  return (
    <Appbar.Action
      icon={({ color, size }) => (
        <MaterialCommunityIcons
          name="pencil-outline"
          color={color}
          size={size}
        />
      )}
      onPress={() => {
        //TODO
        console.log("TODO");
      }}
    />
  );
}

function RepetitionListItem({ repetition }: { repetition: Repetition }) {
  const numbers = useMemo(
    () => Array.from(Array(31).keys()).map((n) => n.toString()),
    [],
  );

  return (
    <Picker
      selectedValue={repetition.count.toString()}
      onValueChange={(_, index) => repetition.updateCount(index)}
    >
      {numbers.map((number) => (
        <Picker.Item key={number} label={number} value={number} />
      ))}
    </Picker>
  );
}

const EnhancedRepetitionListItem = withObservables(
  ["repetition"],
  ({ repetition }) => ({
    repetition,
  }),
)(RepetitionListItem);

function Weight({ set }: { set: Set }) {
  const weightStr = set.weight?.toString() ?? "";

  const handleSetWeight = useCallback(async (weigthStr: string | undefined) => {
    if (typeof weigthStr !== "string") {
      return;
    }

    weightStr.replace(/[^0-9]/g, "");
    const newWeight = Number(weigthStr);
    if (Number.isNaN(newWeight)) {
      return;
    }

    set.updateWeight(newWeight);
  }, []);

  return (
    <TextInput
      keyboardType="numeric"
      label="Paino"
      defaultValue={weightStr}
      onEndEditing={async (e) => {
        await handleSetWeight(e.nativeEvent.text);
      }}
    />
  );
}

const EnhancedWeight = withObservables(["set"], ({ set }) => ({
  set,
}))(Weight);

type Props = {
  set: Set;
  exercise: Exercise;
  repetitions: Repetition[];
};

function EditExercise({ set, repetitions, exercise }: Props) {
  const navigation = useNavigation<NavigationProp<StackParamList>>();
  const [lastSet, setLastSet] = useState<Set | null>();

  useFocusEffect(
    useCallback(() => {
      navigation.setOptions({ title: exercise.name ?? "Muokkaa" });
    }, [set]),
  );

  useEffect(() => {
    SetsController.getLastTime(set).then((res) => {
      if (res.length > 0) {
        setLastSet(res[res.length - 1]);
      } else {
        setLastSet(null);
      }
    });
  }, [set]);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ padding: 10 }}>
        <EnhancedWeight set={set} />
        {repetitions.map((repetition) => (
          <EnhancedRepetitionListItem
            key={repetition.id}
            repetition={repetition}
          />
        ))}
        {lastSet ? <FormattedSet set={lastSet} /> : null}
      </View>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={() => {
          RepetitionsController.save(set.id);
        }}
      />
    </SafeAreaView>
  );
}

const enhance = compose(
  withObservables(["route"], ({ route }) => ({
    set: sets.findAndObserve(route.params.setId),
  })),
  withObservables(["set"], ({ set }) => ({
    repetitions: set.repetitions.observe(),
    exercise: set.exercise.observe(),
  })),
);

export default enhance(EditExercise);

const styles = StyleSheet.create({
  fab: {
    position: "absolute",
    margin: 16,
    right: 0,
    bottom: 0,
  },
});
