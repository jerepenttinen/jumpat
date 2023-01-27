import { useMutation, useQuery } from "@tanstack/react-query";

import { Exercise } from "../data/entities/Exercise";

export function useExercises(name: string) {
  return useQuery({
    queryKey: ["exercises", name],
    queryFn: () => Exercise.find({ where: { name } }),
  });
}

export function useCreateExercise() {
  return useMutation((name: string) => {
    const exercise = new Exercise();
    exercise.name = name;
    return exercise.save();
  });
}
