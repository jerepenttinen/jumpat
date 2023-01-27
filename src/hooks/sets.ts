import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { Exercise } from "../data/entities/Exercise";
import { Set } from "../data/entities/Set";
import { Workout } from "../data/entities/Workout";
import { KEYS } from "./keys";

export function useSet(workoutId: number, setId: number) {
  return useQuery({
    queryKey: KEYS.SET(workoutId, setId),
    queryFn: () =>
      Set.findOne({
        where: { id: setId },
        relations: ["workout", "repetitions", "exercise"],
      }),
  });
}

export function useCreateSet() {
  const queryClient = useQueryClient();

  return useMutation(
    ({ workoutId, exerciseId }: { workoutId: number; exerciseId: number }) => {
      const set = new Set();
      set.workout = new Workout();
      set.workout.id = workoutId;
      set.exercise = new Exercise();
      set.exercise.id = exerciseId;
      return set.save();
    },
    {
      onSettled() {
        queryClient.invalidateQueries();
      },
    },
  );
}

export function useChangeSetWeight() {
  const queryClient = useQueryClient();

  return useMutation(
    ({
      setId,
      newWeight,
    }: {
      workoutId: number;
      setId: number;
      newWeight: number;
    }) => {
      return Set.update({ id: setId }, { weight: newWeight });
    },
    {
      onMutate(variables) {
        const oldSet = queryClient.getQueryData<Set>(
          KEYS.SET(variables.workoutId, variables.setId),
        );
        if (oldSet) {
          oldSet.weight = variables.newWeight;
        }
      },
      onSettled() {
        queryClient.invalidateQueries();
      },
    },
  );
}
