import { database } from "..";
import TableName from "../TableName";
import Workout from "../models/Workout";

export const workouts = database.get<Workout>(TableName.WORKOUTS);

export default class WorkoutsController {
  static async create() {
    return await database.write(async () => await workouts.create());
  }
}
