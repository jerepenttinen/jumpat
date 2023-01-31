import { Q } from "@nozbe/watermelondb";

import { database } from "..";
import TableName from "../TableName";
import Exercise from "../models/Exercise";

export const exercises = database.collections.get<Exercise>(
  TableName.EXERCISES,
);

export default class ExercisesController {
  static async save(name: string) {
    return await database.write(async () => {
      return await exercises.create((exercise) => {
        exercise.name = name;
      });
    });
  }

  static search(name: string) {
    console.log(name);
    return exercises.query(
      Q.where("name", Q.like(`%${Q.sanitizeLikeString(name)}%`)),
    );
  }
}
