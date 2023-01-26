import { useMutation, useQueryClient } from "@tanstack/react-query";

import { Repetition } from "../data/entities/Repetition";

export function useCreateRepetition() {
  const queryClient = useQueryClient();

  return useMutation(
    (workoutId: number) => {
      const repetition = new Repetition();
      repetition.set.id = workoutId;
      return repetition.save();
    },
    {
      onSettled() {
        queryClient.invalidateQueries();
      },
    },
  );
}
