import { database } from "..";
import TableName from "../TableName";
import Repetition from "../models/Repetition";

export const repetitions = database.collections.get<Repetition>(
  TableName.REPETITIONS,
);

export default class RepetitionsController {
  static async save(setId: string) {
    return await database.write(async () => {
      return await repetitions.create((repetition) => {
        repetition.set.id = setId;
        repetition.count = 10;
      });
    });
  }
}
