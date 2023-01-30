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
}
