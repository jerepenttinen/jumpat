import { Model, Relation } from "@nozbe/watermelondb";
import { field, relation } from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Exercise from "./Exercise";
import Workout from "./Workout";

export default class Set extends Model {
  @field("weight") weight!: number;

  @relation(TableName.EXERCISES, "exercise_id") exercise!: Relation<Exercise>;

  @relation(TableName.WORKOUTS, "workout_id") workout!: Relation<Workout>;
}
