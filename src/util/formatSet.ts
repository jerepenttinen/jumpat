import Set from "../data/models/Set";

export default async function (set: Set) {
  const repetitions = await set.repetitions.fetch();
  const exercise = await set.exercise.fetch();

  const reps = repetitions ? [...repetitions].reverse() : repetitions;

  return `${exercise.name} ${set.weight} ${reps
    ?.map((rep) => rep.count)
    .join(" ")}`;
}
