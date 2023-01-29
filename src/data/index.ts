import Database from "@nozbe/watermelondb/Database";
import SQLiteAdapter from "@nozbe/watermelondb/adapters/sqlite";

import Exercise from "./models/Exercise";
import Repetition from "./models/Repetition";
import Set from "./models/Set";
import Workout from "./models/Workout";
import { schema } from "./schema";

const adapter = new SQLiteAdapter({
  schema,
  dbName: "jumpat",
  // migrations, // uncomment this once you start adding migrations
});

export const database = new Database({
  adapter,
  modelClasses: [Exercise, Repetition, Set, Workout],
});
