import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";

import { ExerciseModel } from "./ExerciseModel";
import { RepetitionModel } from "./RepetitionModel";
import { WorkoutModel } from "./WorkoutModel";

@Entity("set")
export class SetModel {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "float", nullable: true })
  weight: number;

  @Column({ type: "datetime", default: () => "date('now')" })
  createdAt: Date;

  @OneToMany(() => RepetitionModel, (repetition) => repetition.set)
  repetitions: RepetitionModel[];

  @ManyToOne(() => ExerciseModel, (exercise) => exercise.sets)
  exercise: ExerciseModel;

  @ManyToOne(() => WorkoutModel, (workout) => workout.sets, {
    onDelete: "CASCADE",
  })
  workout: WorkoutModel;
}
