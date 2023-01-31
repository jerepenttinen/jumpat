import { Model, Query } from "@nozbe/watermelondb";
import { Associations } from "@nozbe/watermelondb/Model";
import {
  children,
  date,
  readonly,
  writer,
} from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Set from "./Set";

export default class Workout extends Model {
  static table = TableName.WORKOUTS;

  public static associations: Associations = {
    [TableName.SETS]: {
      type: "has_many",
      foreignKey: "workout_id",
    },
  };

  @readonly @date("created_at") createdAt!: Date;

  @children(TableName.SETS) sets!: Query<Set>;

  @writer async destroy() {
    await this.sets.markAllAsDeleted();
    await this.markAsDeleted();
  }
}
