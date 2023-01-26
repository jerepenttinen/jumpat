import { MaterialCommunityIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useMemo, useState } from "react";
import { SafeAreaView, StyleSheet, View } from "react-native";
import { ActivityIndicator, Appbar, FAB, TextInput } from "react-native-paper";
import WheelPicker from "react-native-wheely";

import { Repetition } from "../data/entities/Repetition";
import { Set } from "../data/entities/Set";
import { useCreateRepetition } from "../hooks/repetitions";
import { useSet } from "../hooks/sets";
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

function RepetitionListItem({
  listIndex,
  repetition,
}: {
  listIndex: number;
  repetition: Repetition;
}) {
  const [selected, setSelected] = useState((repetition.count ?? 10) - 1);
  const numbers = useMemo(
    () =>
      Array.from(Array(31).keys())
        .map((n) => n.toString())
        .slice(1),
    [],
  );

  const handleChange = useCallback((index: number) => {
    // repetitionRepository.updateCount(repetition.id, index + 1);
    setSelected(index);
  }, []);

  return (
    <WheelPicker
      selectedIndex={selected}
      options={numbers}
      onChange={handleChange}
    />
  );
}

function Weight({ set }: { set: Set }) {
  const [weight, setWeight] = useState<number>(set.weight);
  const weightStr = weight?.toString();

  const handleSetWeight = useCallback(async (weigthStr: string | undefined) => {
    if (typeof weigthStr === "string") {
      const w = Number(weigthStr);
      if (!Number.isNaN(w)) {
        // await setRepository.updateWeight(set.id, w);
        setWeight(w);
      }
    }
  }, []);
  return <TextInput value={weightStr} onChangeText={handleSetWeight} />;
}

function CreateRepetitionFAB({ setId }: { setId: number }) {
  const createRepetitionMutation = useCreateRepetition();
  return (
    <FAB
      icon="plus"
      style={styles.fab}
      onPress={() => {
        createRepetitionMutation.mutate(setId);
      }}
    />
  );
}
export default function EditExercise({ navigation, route }: ScreenProps) {
  const set = useSet(route.params.setId);

  if (set.isLoading || !set.data) {
    return <ActivityIndicator />;
  }

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ padding: 10 }}>
        {/* <Weight set={set.data} /> */}
        {set.data.repetitions?.map((repetition, i) => (
          <RepetitionListItem
            listIndex={i + 1}
            repetition={repetition}
            key={repetition.id}
          />
        ))}
      </View>
      <CreateRepetitionFAB setId={set.data.id!} />
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
