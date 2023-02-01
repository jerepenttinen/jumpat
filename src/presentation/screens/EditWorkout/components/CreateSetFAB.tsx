import withObservables from "@nozbe/with-observables";
import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
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

import ExercisesController from "~/data/controllers/ExercisesController";
import SetsController from "~/data/controllers/SetsController";
import { workouts } from "~/data/controllers/WorkoutsController";
import Exercise from "~/data/models/Exercise";

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
  const { t } = useTranslation(["EditWorkout:CreateSetFAB"]);

  return (
    <>
      {exercises.length > 0 ? (
        <FlatList
          data={exercises}
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
            <Text>
              {t("EditWorkout:CreateSetFAB:createExerciseButton")} "
              {searchQuery}"
            </Text>
          </Button>
        )
      )}
    </>
  );
}

type SearchProps = {
  onSelect: OnSelectFunc;
};

function Search({ onSelect }: SearchProps) {
  const [searchQuery, setSearchQuery] = useState("");
  const onChangeSearch = (query: string | undefined) =>
    setSearchQuery(query ?? "");

  const [exercises, setExercises] = useState<Exercise[]>([]);

  useEffect(() => {
    if (searchQuery.length > 0) {
      ExercisesController.search(searchQuery).fetch().then(setExercises);
    } else {
      setExercises([]);
    }
  }, [searchQuery]);

  const { t } = useTranslation(["EditWorkout:CreateSetFAB"]);

  return (
    <>
      <Searchbar
        autoFocus
        placeholder={t("EditWorkout:CreateSetFAB:searchBar")}
        onChangeText={onChangeSearch}
        value={searchQuery}
        style={{ marginBottom: 20 }}
      />
      <SearchResults
        onSelect={onSelect}
        searchQuery={searchQuery}
        exercises={exercises}
      />
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
