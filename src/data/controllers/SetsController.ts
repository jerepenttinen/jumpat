import { Q } from "@nozbe/watermelondb";

import { database } from "..";
import TableName from "../TableName";
import Exercise from "../models/Exercise";
import Set from "../models/Set";
import Workout from "../models/Workout";

export const sets = database.collections.get<Set>(TableName.SETS);

export default class SetsController {
  static async save(workoutId: string, exerciseId: string) {
    return await database.write(async () => {
      const workout = await database
        .get<Workout>(TableName.WORKOUTS)
        .find(workoutId);
      const exercise = await database
        .get<Exercise>(TableName.EXERCISES)
        .find(exerciseId);

      return await sets.create((set) => {
        set.exercise.set(exercise);
        set.workout.set(workout);
      });
    });
  }

  static async getLastTime(set: Set) {
    const workout = await set.workout.fetch();
    const exercise = await set.exercise.fetch();

    return await sets
      .query(
        Q.and(
          Q.where("weight", Q.eq(set.weight)),
          Q.where("workout_id", Q.notEq(workout.id)),
          Q.where("exercise_id", Q.eq(exercise.id)),
        ),
        Q.on(
          TableName.WORKOUTS,
          Q.where("created_at", Q.lt(workout.createdAt.valueOf())),
        ),
        // TODO: Order by workouts.created_at
        // Q.sortBy("created_at", Q.desc),
        // Q.take(1),
      )
      .fetch();
  }
}
