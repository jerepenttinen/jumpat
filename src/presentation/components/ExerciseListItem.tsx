import withObservables from "@nozbe/with-observables";
import { View } from "react-native";
import { Text } from "react-native-paper";

import { useAppLocale } from "../locales/locale";

import Repetition from "~/data/models/Repetition";
import Workout from "~/data/models/Workout";

type Props = {
  repetitions: Repetition[];
  workout: Workout;
};

function ExerciseListItem({ repetitions, workout }: Props) {
  const { formatDate } = useAppLocale();
  const out = `${formatDate(workout.createdAt)}`;

  const reps = repetitions.reduce((acc, cur) => acc + cur.count, 0);

  return (
    <View style={{ display: "flex", flexDirection: "row" }}>
      <Text>
        {out}
        {repetitions.length > 0 ? ": " : ""}
      </Text>
      {repetitions.map((repetition) => (
        <EnhancedRep repetition={repetition} key={repetition.id} />
      ))}
      <Text> ∑ {reps}</Text>
    </View>
  );
}

const enhance = withObservables(["set"], ({ set }) => ({
  repetitions: set.repetitions.observe(),
  workout: set.workout.observe(),
}));

export default enhance(ExerciseListItem);

function Rep({ repetition }: { repetition: Repetition }) {
  return <Text>{repetition.count} </Text>;
}

const EnhancedRep = withObservables(["repetition"], ({ repetition }) => ({
  repetition,
}))(Rep);
