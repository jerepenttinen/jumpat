import { MaterialCommunityIcons } from "@expo/vector-icons";
import { useFocusEffect } from "@react-navigation/native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useMemo } from "react";
import { SafeAreaView, StyleSheet, View } from "react-native";
import { ActivityIndicator, Appbar, FAB, TextInput } from "react-native-paper";
import WheelPicker from "react-native-wheely";

import { Repetition } from "../data/entities/Repetition";
import { Set } from "../data/entities/Set";
import {
  useChangeRepetitionCount,
  useCreateRepetition,
} from "../hooks/repetitions";
import { useChangeSetWeight, useSet } from "../hooks/sets";
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
  const changeRepetitionCount = useChangeRepetitionCount();
  const numbers = useMemo(
    () => Array.from(Array(31).keys()).map((n) => n.toString()),
    [],
  );

  const handleChange = useCallback((index: number) => {
    changeRepetitionCount.mutate({
      repetitionId: repetition.id,
      newCount: index,
    });
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
  const changeSetWeight = useChangeSetWeight();
  const weightStr = set.weight?.toString() ?? "";

  const handleSetWeight = useCallback(async (weigthStr: string | undefined) => {
    if (typeof weigthStr === "string") {
      weightStr.replace(/[^0-9]/g, "");
      const newWeight = Number(weigthStr);
      if (!Number.isNaN(newWeight)) {
        changeSetWeight.mutate({
          workoutId: set.workout.id,
          setId: set.id,
          newWeight,
        });
      }
    }
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
  const set = useSet(route.params.workoutId, route.params.setId);

  useFocusEffect(
    useCallback(() => {
      navigation.setOptions({ title: set.data?.exercise.name ?? "Muokkaa" });
    }, [set.data]),
  );

  if (set.isLoading || !set.data) {
    return <ActivityIndicator />;
  }

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ padding: 10 }}>
        <Weight set={set.data} />
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
