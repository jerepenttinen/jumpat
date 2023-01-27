import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { Set } from "../data/entities/Set";
import { KEYS } from "./keys";
import { Workout } from "../data/entities/Workout";

export function useSet(workoutId: number, setId: number) {
  return useQuery({
    queryKey: KEYS.SET(workoutId, setId),
    queryFn: () =>
      Set.findOne({
        where: { id: setId },
        relations: ["workout", "repetitions"],
      }),
  });
}

export function useCreateSet() {
  const queryClient = useQueryClient();

  return useMutation(
    (workoutId: number) => {
      const set = new Set();
      set.workout.id = workoutId;
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
