import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useEffect, useState } from "react";
import { SafeAreaView, StyleSheet, TouchableOpacity, View } from "react-native";
import { FAB, Text, TextInput } from "react-native-paper";

import { useDataSource } from "../data/datasource";
import { RepetitionModel } from "../data/entities/RepetitionModel";
import { StackParamList } from "../navigation/Navigator";

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
      await setRepository.updateWeight(route.params.setId, w);
      setWeight(w);
    }
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ padding: 10 }}>
        <TextInput value={weightStr} onChangeText={handleSetWeight} />
        {repetitions?.map((repetition, i) => (
          <TouchableOpacity key={repetition.id}>
            <Text>
              {i + 1} {repetition.count}
            </Text>
          </TouchableOpacity>
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
