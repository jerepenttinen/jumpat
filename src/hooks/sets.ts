import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { Set } from "../data/entities/Set";

const KEYS = {
  SET: (id: number) => ["sets", id],
} as const;

export function useSet(setId: number) {
  return useQuery({
    queryKey: KEYS.SET(setId),
    queryFn: () =>
      Set.findOne({
        where: { id: setId },
        relations: ["repetitions"],
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
