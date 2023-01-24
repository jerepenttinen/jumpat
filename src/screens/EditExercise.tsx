import { MaterialCommunityIcons } from "@expo/vector-icons";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useEffect, useMemo, useState } from "react";
import { SafeAreaView, StyleSheet, View } from "react-native";
import { Appbar, FAB, TextInput } from "react-native-paper";
import WheelPicker from "react-native-wheely";

import { useDataSource } from "../data/datasource";
import { RepetitionModel } from "../data/entities/RepetitionModel";
import { StackParamList } from "../navigation/Navigator";

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
  repetition: RepetitionModel;
}) {
  const { repetitionRepository } = useDataSource();

  const [selected, setSelected] = useState((repetition.count ?? 10) - 1);
  const numbers = useMemo(
    () =>
      Array.from(Array(31).keys())
        .map((n) => n.toString())
        .slice(1),
    [],
  );

  const handleChange = useCallback((index: number) => {
    repetitionRepository.updateCount(repetition.id, index + 1);
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
export default function EditExercise({
  navigation,
  route,
}: NativeStackScreenProps<StackParamList, "EditExercise">) {
  const { repetitionRepository, setRepository } = useDataSource();
  const [weight, setWeight] = useState<number>();
  const [repetitions, setRepetitions] = useState<RepetitionModel[]>([]);

  const weightStr = weight?.toString();

  useEffect(() => {
    setRepository.findById(route.params.setId).then((set) => {
      if (typeof set.repetitions !== "undefined") {
        setRepetitions(set.repetitions);
      }
      if (typeof set.weight !== "undefined") {
        setWeight(set.weight);
      }
    });
  }, []);

  const handleSetWeight = useCallback(async (weigthStr: string | undefined) => {
    if (typeof weigthStr === "string") {
      const w = Number(weigthStr);
      if (!Number.isNaN(w)) {
        await setRepository.updateWeight(route.params.setId, w);
        setWeight(w);
      }
    }
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ padding: 10 }}>
        <TextInput value={weightStr} onChangeText={handleSetWeight} />
        {repetitions?.map((repetition, i) => (
          <RepetitionListItem
            listIndex={i + 1}
            repetition={repetition}
            key={repetition.id}
          />
        ))}
      </View>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={async () => {
          const repetition = await repetitionRepository.create(
            route.params.setId,
          );
          setRepetitions((previous) => [...previous, repetition]);
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
