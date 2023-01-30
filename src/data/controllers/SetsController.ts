import { database } from "..";
import TableName from "../TableName";
import Set from "../models/Set";

export const sets = database.collections.get<Set>(TableName.SETS);

export default class SetsController {
  static async save(workoutId: string, exerciseId: string) {
    return await database.write(async () => {
      return await sets.create((set) => {
        set.exercise.id = exerciseId;
        set.workout.id = workoutId;
      });
    });
  }
}
