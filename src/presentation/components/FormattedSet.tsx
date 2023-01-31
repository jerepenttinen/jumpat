import withObservables from "@nozbe/with-observables";
import { Text } from "react-native-paper";

import Exercise from "~/data/models/Exercise";
import Repetition from "~/data/models/Repetition";
import Set from "~/data/models/Set";

type Props = {
  set: Set;
  repetitions: Repetition[];
  exercise: Exercise;
};

function FormattedSet({ set, repetitions, exercise }: Props) {
  const reps = repetitions ? [...repetitions].reverse() : repetitions;

  const out = `${exercise.name} ${set.weight} ${reps
    ?.map((rep) => rep.count)
    .join(" ")}`;

  return <Text>{out}</Text>;
}

const enhance = withObservables(["set"], ({ set }) => ({
  set,
  repetitions: set.repetitions.observe(),
  exercise: set.exercise.observe(),
}));

export default enhance(FormattedSet);
