import { useMutation, useQueryClient } from "@tanstack/react-query";

import { Repetition } from "../data/entities/Repetition";
import { Set } from "../data/entities/Set";

export function useCreateRepetition() {
  const queryClient = useQueryClient();

  return useMutation(
    (setId: number) => {
      const repetition = new Repetition();
      repetition.set = new Set();
      repetition.set.id = setId;
      repetition.count = 10;
      return repetition.save();
    },
    {
      onSettled() {
        queryClient.invalidateQueries();
      },
    },
  );
}

export function useChangeRepetitionCount() {
  const queryClient = useQueryClient();

  return useMutation(
    ({
      repetitionId,
      newCount,
    }: {
      repetitionId: number;
      newCount: number;
    }) => {
      return Repetition.update({ id: repetitionId }, { count: newCount });
    },
    {
      onSettled() {
        queryClient.invalidateQueries();
      },
    },
  );
}
