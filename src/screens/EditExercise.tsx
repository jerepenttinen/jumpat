import { MaterialCommunityIcons } from "@expo/vector-icons";
import withObservables, { ObservableifyProps } from "@nozbe/with-observables";
import {
  NavigationProp,
  useFocusEffect,
  useNavigation,
} from "@react-navigation/native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useMemo } from "react";
import { SafeAreaView, StyleSheet, View } from "react-native";
import { Appbar, FAB, TextInput } from "react-native-paper";
import WheelPicker from "react-native-wheely";
import { compose } from "recompose";

import { sets } from "../data/controllers/SetsController";
import Exercise from "../data/models/Exercise";
import Repetition from "../data/models/Repetition";
import Set from "../data/models/Set";
import { StackParamList } from "../navigation/Navigator";

type ScreenProps = NativeStackScreenProps<StackParamList, "EditExercise">;

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
  // const changeRepetitionCount = useChangeRepetitionCount();
  const numbers = useMemo(
    () => Array.from(Array(31).keys()).map((n) => n.toString()),
    [],
  );

  const handleChange = useCallback((index: number) => {
    // changeRepetitionCount.mutate({
    //   repetitionId: repetition.id,
    //   newCount: index,
    // });
  }, []);

  return (
    <WheelPicker
      selectedIndex={repetition.count}
      options={numbers}
      onChange={handleChange}
    />
  );
}

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
      onEndEditing={(e) => {
        handleSetWeight(e.nativeEvent.text);
      }}
    />
  );
}

function CreateRepetitionFAB({ setId }: { setId: number }) {
  // const createRepetitionMutation = useCreateRepetition();
  return (
    <FAB
      icon="plus"
      style={styles.fab}
      onPress={() => {
        // createRepetitionMutation.mutate(setId);
      }}
    />
  );
}

type Props = {
  set: Set;
  exercise: Exercise;
  repetitions: Repetition[];
};

function EditExercise({ set, repetitions, exercise }: Props) {
  const navigation = useNavigation<NavigationProp<StackParamList>>();

  useFocusEffect(
    useCallback(() => {
      navigation.setOptions({ title: exercise.name ?? "Muokkaa" });
    }, [set]),
  );

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ padding: 10 }}>
        <Weight set={set} />
        {/* {set.data.repetitions?.map((repetition) => (
          <RepetitionListItem repetition={repetition} key={repetition.id} />
        ))} */}
      </View>
      {/* <CreateRepetitionFAB setId={set.data.id!} /> */}
    </SafeAreaView>
  );
}

type InputProps = ObservableifyProps<Props & ScreenProps, "set">;
const enhance = compose(
  withObservables(["route"], ({ route }: InputProps) => ({
    set: sets.findAndObserve(route.params.setId),
  })),
  withObservables(["set"], ({ set }: { set: Set }) => ({
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
