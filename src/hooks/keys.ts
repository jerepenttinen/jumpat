export const KEYS = {
  WORKOUTS: ["workouts"],
  WORKOUT: (id: number) => ["workouts", id],
  SET: (workoutId: number, setId: number) => [
    "workouts",
    workoutId,
    "sets",
    setId,
  ],
} as const;
