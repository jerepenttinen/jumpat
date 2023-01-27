import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { Workout } from "../data/entities/Workout";
import { KEYS } from "./keys";

export function useWorkouts() {
  return useQuery({
    queryKey: KEYS.WORKOUTS,
    queryFn: () =>
      Workout.find({
        relations: [
          "sets",
          "sets.repetitions",
          "sets.workout",
          "sets.exercise",
        ],
      }),
  });
}

export function useWorkout(workoutId: number) {
  return useQuery({
    queryKey: KEYS.WORKOUT(workoutId),
    queryFn: () =>
      Workout.findOne({
        where: { id: workoutId },
        relations: [
          "sets",
          "sets.repetitions",
          "sets.workout",
          "sets.exercise",
        ],
      }),
  });
}

export function useCreateWorkout() {
  const queryClient = useQueryClient();

  return useMutation(() => Workout.create().save(), {
    onSettled() {
      queryClient.invalidateQueries();
    },
  });
}
