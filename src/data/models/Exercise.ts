import { Model, Query } from "@nozbe/watermelondb";
import { Associations } from "@nozbe/watermelondb/Model";
import { children, field } from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Set from "./Set";

export default class Exercise extends Model {
  static table = TableName.EXERCISES;

  public static associations: Associations = {
    [TableName.SETS]: {
      type: "has_many",
      foreignKey: "set_id",
    },
  };

  @field("name") name!: string;

  @children(TableName.SETS) sets!: Query<Set>;
}
