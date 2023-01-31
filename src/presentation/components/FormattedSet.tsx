import withObservables from "@nozbe/with-observables";
import { View } from "react-native";
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
  const out = `${exercise.name} ${set.weight} kg`;

  return (
    <View style={{ display: "flex", flexDirection: "row" }}>
      <Text>
        {out}
        {repetitions.length > 0 ? ": " : ""}
      </Text>
      {repetitions.map((repetition) => (
        <EnhancedRep repetition={repetition} key={repetition.id} />
      ))}
    </View>
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
