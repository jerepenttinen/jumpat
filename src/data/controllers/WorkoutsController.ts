import { database } from "..";
import TableName from "../TableName";
import Workout from "../models/Workout";

export const workouts = database.collections.get<Workout>(TableName.WORKOUTS);
