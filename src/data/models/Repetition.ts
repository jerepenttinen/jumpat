import { Model, Relation } from "@nozbe/watermelondb";
import { field, relation } from "@nozbe/watermelondb/decorators";

import TableName from "../TableName";
import Set from "./Set";

export default class Repetition extends Model {
  static table = TableName.REPETITIONS;

  @field("count") count!: number;

  @relation(TableName.SETS, "set_id") set!: Relation<Set>;
}
