import { Set } from "../data/entities/Set";

export default function (set: Set) {
  const reps = set.repetitions
    ? [...set.repetitions].reverse()
    : set.repetitions;

  return `${set.exercise?.name} ${set.weight} ${reps
    ?.map((rep) => rep.count)
    .join(" ")}`;
}
