import { Model, Relation } from "@nozbe/watermelondb";
import { Associations } from "@nozbe/watermelondb/Model";
import { field, relation } from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Set from "./Set";

export default class Repetition extends Model {
  static table = TableName.REPETITIONS;

  public static associations: Associations = {
    [TableName.SETS]: {
      type: "belongs_to",
      key: "set_id",
    },
  };

  @field("count") count!: number;

  @relation(TableName.SETS, "set_id") set!: Relation<Set>;
}
