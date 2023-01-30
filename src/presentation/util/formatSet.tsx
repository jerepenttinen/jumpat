import { useEffect, useState } from "react";
import { Text } from "react-native-paper";

import Set from "~/data/models/Set";

async function formatSet(set: Set) {
  const repetitions = await set.repetitions.fetch();
  const exercise = await set.exercise.fetch();

  const reps = repetitions ? [...repetitions].reverse() : repetitions;

  return `${exercise.name} ${set.weight} ${reps
    ?.map((rep) => rep.count)
    .join(" ")}`;
}

export default function ({ set }: { set: Set }) {
  const [formatted, setFormatted] = useState("");

  useEffect(() => {
    formatSet(set).then(setFormatted);
  }, [set]);

  return <Text>{formatted}</Text>;
}
