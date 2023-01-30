import { Model, Query, Relation } from "@nozbe/watermelondb";
import { Associations } from "@nozbe/watermelondb/Model";
import {
  action,
  children,
  field,
  relation,
} from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Exercise from "./Exercise";
import Repetition from "./Repetition";
import Workout from "./Workout";

export default class Set extends Model {
  static table = TableName.SETS;
  public static associations: Associations = {
    [TableName.REPETITIONS]: {
      type: "has_many",
      foreignKey: "id",
    },
  };

  @field("weight") weight!: number;

  @relation(TableName.EXERCISES, "exercise_id") exercise!: Relation<Exercise>;

  @relation(TableName.WORKOUTS, "workout_id") workout!: Relation<Workout>;

  @children(TableName.REPETITIONS) repetitions!: Query<Repetition>;

  @action async updateWeight(weight: number) {
    await this.update((set) => {
      set.weight = weight;
    });
  }
}
