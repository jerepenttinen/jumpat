import { appSchema, tableSchema } from "@nozbe/watermelondb/Schema";

import TableName from "./TableName";

export const schema = appSchema({
  version: 1,
  tables: [
    tableSchema({
      name: TableName.EXERCISES,
      columns: [{ name: "name", type: "string" }],
    }),
    tableSchema({
      name: TableName.REPETITIONS,
      columns: [
        { name: "count", type: "number" },
        { name: "set_id", type: "string", isIndexed: true },
      ],
    }),
    tableSchema({
      name: TableName.SETS,
      columns: [
        { name: "weight", type: "number" },
        { name: "exercise_id", type: "string", isIndexed: true },
        { name: "workout_id", type: "string", isIndexed: true },
      ],
    }),
    tableSchema({
      name: TableName.WORKOUTS,
      columns: [{ name: "created_at", type: "number" }],
    }),
  ],
});
