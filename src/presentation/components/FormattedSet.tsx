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
  const out = `${exercise.name} ${set.weight} `;

  return (
    <>
      <Text>{out}</Text>
      {repetitions.map((repetition) => (
        <EnhancedRep repetition={repetition} key={repetition.id} />
      ))}
    </>
  );
}

const enhance = withObservables(["set"], ({ set }) => ({
  set,
  repetitions: set.repetitions.observe(),
  exercise: set.exercise.observe(),
}));

export default enhance(FormattedSet);

function Rep({ repetition }: { repetition: Repetition }) {
  return <Text>{repetition.count} </Text>;
}

const EnhancedRep = withObservables(["repetition"], ({ repetition }) => ({
  repetition,
}))(Rep);
