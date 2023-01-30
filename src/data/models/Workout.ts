import { Model, Query } from "@nozbe/watermelondb";
import { Associations } from "@nozbe/watermelondb/Model";
import {
  action,
  children,
  date,
  readonly,
} from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Set from "./Set";

export default class Workout extends Model {
  static table = TableName.WORKOUTS;

  public static associations: Associations = {
    [TableName.SETS]: {
      type: "has_many",
      foreignKey: "id",
    },
  };

  @readonly @date("created_at") createdAt!: Date;

  @children(TableName.SETS) sets!: Query<Set>;

  @action async destroy() {
    await this.sets.markAllAsDeleted();
    await this.markAsDeleted();
  }
}
