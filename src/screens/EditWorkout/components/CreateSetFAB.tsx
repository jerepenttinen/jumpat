import withObservables from "@nozbe/with-observables";
import { useMemo, useState } from "react";
import { FlatList, StyleSheet, TouchableOpacity } from "react-native";
import {
  Button,
  FAB,
  Modal,
  Portal,
  Searchbar,
  useTheme,
  Text,
} from "react-native-paper";

import ExercisesController, {
  exercises,
} from "../../../data/controllers/ExercisesController";
import SetsController from "../../../data/controllers/SetsController";
import { workouts } from "../../../data/controllers/WorkoutsController";
import Exercise from "../../../data/models/Exercise";

type OnSelectFunc = (exercise: Exercise) => void;

type SearchResultsProps = {
  exercises: Exercise[];
  onSelect: OnSelectFunc;
  searchQuery: string;
};

function SearchResults({
  exercises,
  onSelect,
  searchQuery,
}: SearchResultsProps) {
  const filteredExercises = useMemo(() => {
    return exercises.filter((exercise) => exercise.name === searchQuery);
  }, [exercises, searchQuery]);

  return (
    <>
      {exercises.length > 0 ? (
        <FlatList
          data={filteredExercises}
          renderItem={({ item: exercise }) => (
            <TouchableOpacity
              onPress={() => {
                onSelect(exercise);
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
              onSelect(await ExercisesController.save(searchQuery));
            }}
          >
            <Text>Luo "{searchQuery}"</Text>
          </Button>
        )
      )}
    </>
  );
}

const EnhancedSearchResults = withObservables([], () => ({
  exercises: exercises.query().observe(),
}))(SearchResults);

type SearchProps = {
  onSelect: OnSelectFunc;
};

function Search({ onSelect }: SearchProps) {
  const [searchQuery, setSearchQuery] = useState("");
  const onChangeSearch = (query: string | undefined) =>
    setSearchQuery(query ?? "");

  return (
    <>
      <Searchbar
        placeholder="Liike"
        onChangeText={onChangeSearch}
        value={searchQuery}
        style={{ marginBottom: 20 }}
      />
      <EnhancedSearchResults onSelect={onSelect} searchQuery={searchQuery} />
    </>
  );
}

function CreateSetFAB({
  workoutId,
  action,
}: {
  workoutId: string;
  action: (setId: string) => void;
}) {
  const [visible, setVisible] = useState(false);

  const showModal = () => setVisible(true);
  const hideModal = () => setVisible(false);

  const createSet = async (exercise: Exercise) => {
    const set = await SetsController.save(workoutId, exercise.id);
    action(set.id);
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
          <Search
            onSelect={(exercise) => {
              createSet(exercise);
              hideModal();
            }}
          />
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

const enhance = withObservables(["workoutId"], ({ workoutId }) => ({
  workout: workouts.findAndObserve(workoutId),
}));

export default enhance(CreateSetFAB);

const styles = StyleSheet.create({
  fab: {
    position: "absolute",
    margin: 16,
    right: 0,
    bottom: 0,
  },
});
