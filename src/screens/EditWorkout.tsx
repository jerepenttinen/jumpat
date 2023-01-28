import { MaterialCommunityIcons } from "@expo/vector-icons";
import { useFocusEffect } from "@react-navigation/native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { useCallback, useState } from "react";
import {
  FlatList,
  SafeAreaView,
  StyleSheet,
  TouchableOpacity,
} from "react-native";
import {
  ActivityIndicator,
  Appbar,
  Button,
  FAB,
  IconButton,
  List,
  Modal,
  Portal,
  Searchbar,
  Surface,
  Text,
  useTheme,
} from "react-native-paper";

import { Exercise } from "../data/entities/Exercise";
import { Set } from "../data/entities/Set";
import { useCreateExercise, useExercises } from "../hooks/exercises";
import { useCreateSet } from "../hooks/sets";
import { useWorkout } from "../hooks/workouts";
import { useAppLocale } from "../locales/locale";
import { StackParamList } from "../navigation/Navigator";

type ScreenProps = NativeStackScreenProps<StackParamList, "EditWorkout">;

export function EditWorkoutHeader() {
  return (
    <Appbar.Action
      icon={({ color, size }) => (
        <MaterialCommunityIcons name="calendar" color={color} size={size} />
      )}
      onPress={() => {
        //TODO
        console.log("TODO");
      }}
    />
  );
}

function ExerciseListItem({
  set,
  navigation,
}: { set: Set } & Pick<ScreenProps, "navigation">) {
  return (
    <List.Item
      title={set.exercise?.name}
      right={(props) => (
        <IconButton
          {...props}
          icon="pencil-outline"
          onPress={() => {
            navigation.navigate("EditExercise", {
              workoutId: set.workout.id,
              setId: set.id,
            });
          }}
        />
      )}
    />
  );
}

function CreateSetFAB({
  workoutId,
  action,
}: {
  workoutId: number;
  action: (workoutId: number, setId: number, exerciseId: number) => void;
}) {
  const createSetMutation = useCreateSet();
  const createExercise = useCreateExercise();

  const [visible, setVisible] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");

  const exercises = useExercises(searchQuery);

  const showModal = () => setVisible(true);
  const hideModal = () => setVisible(false);
  const onChangeSearch = (query: string | undefined) =>
    setSearchQuery(query ?? "");

  const createSet = async (exercise: Exercise) => {
    const set = await createSetMutation.mutateAsync({
      workoutId,
      exerciseId: exercise.id,
    });

    action(workoutId, set.id, exercise.id);
  };

  const theme = useTheme();

  return (
    <>
      <Portal>
        <Modal
          visible={visible}
          onDismiss={hideModal}
          contentContainerStyle={{
            margin: 10,
            padding: 20,
            backgroundColor: theme.colors.background,
          }}
        >
          <Searchbar
            placeholder="Liike"
            onChangeText={onChangeSearch}
            value={searchQuery}
            style={{ marginBottom: 20 }}
          />
          {exercises.isLoading || exercises.data === undefined ? (
            <ActivityIndicator />
          ) : exercises.data.length > 0 ? (
            <FlatList
              data={exercises.data}
              renderItem={({ item: exercise }) => (
                <TouchableOpacity
                  onPress={() => {
                    createSet(exercise);
                    hideModal();
                  }}
                >
                  <Text>{exercise.name}</Text>
                </TouchableOpacity>
              )}
            />
          ) : (
            searchQuery.length > 0 && (
              <Button
                mode="contained-tonal"
                onPress={async () => {
                  createSet(await createExercise.mutateAsync(searchQuery));
                  hideModal();
                }}
              >
                <Text>Luo "{searchQuery}"</Text>
              </Button>
            )
          )}
        </Modal>
      </Portal>
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={() => {
          showModal();
        }}
      />
    </>
  );
}

export default function EditWorkout({ navigation, route }: ScreenProps) {
  const workout = useWorkout(route.params.workoutId);
  const { formatDate } = useAppLocale();

  useFocusEffect(
    useCallback(() => {
      navigation.setOptions({
        title: formatDate(workout.data?.createdAt!),
      });
    }, [workout.data]),
  );

  if (workout.isLoading) {
    return <ActivityIndicator />;
  }

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Surface elevation={0}>
        <FlatList
          data={workout.data?.sets}
          renderItem={({ item }) => (
            <ExerciseListItem set={item} navigation={navigation} />
          )}
          contentContainerStyle={{ paddingBottom: 100 }}
        />
      </Surface>
      <CreateSetFAB
        workoutId={route.params.workoutId}
        action={(workoutId, setId) => {
          navigation.navigate("EditExercise", { workoutId, setId });
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
