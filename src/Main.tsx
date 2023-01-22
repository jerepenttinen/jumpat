import { useCallback, useState } from "react";
import { TouchableOpacity, View } from "react-native";
import { Text, Button, TextInput } from "react-native-paper";
import { SafeAreaView } from "react-native-safe-area-context";

import { useDataSource } from "./data/datasource";

interface Exercise {
  id: number;
  name: string;
}

export default function Main() {
  const { exerciseRepository } = useDataSource();

  const [newExercise, setNewExercise] = useState("");
  const [exercises, setExercises] = useState<Exercise[]>([]);

  const handleCreateExercise = useCallback(async () => {
    const exercise = await exerciseRepository.create({ name: newExercise });
    setExercises((current) => [...current, exercise]);
    setNewExercise("");
  }, [newExercise, setNewExercise]);

  return (
    <SafeAreaView>
      <View>
        <TextInput value={newExercise} onChangeText={setNewExercise} />
        <Button onPress={handleCreateExercise} mode="contained">
          Luo
        </Button>
      </View>
      <View>
        {exercises.map((exercise) => (
          <TouchableOpacity key={exercise.id}>
            <Text>{exercise.name}</Text>
          </TouchableOpacity>
        ))}
      </View>
    </SafeAreaView>
  );
}
