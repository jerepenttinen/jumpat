import {
  BaseEntity,
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";

import { Exercise } from "./Exercise";
import { Repetition } from "./Repetition";
import { Workout } from "./Workout";

@Entity("set")
export class Set extends BaseEntity {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "float", nullable: true })
  weight: number;

  @Column({ type: "datetime", default: () => "date('now')" })
  createdAt: Date;

  @OneToMany(() => Repetition, (repetition) => repetition.set)
  repetitions: Repetition[];

  @ManyToOne(() => Exercise, (exercise) => exercise.sets)
  exercise: Exercise;

  @ManyToOne(() => Workout, (workout) => workout.sets, {
    onDelete: "CASCADE",
  })
  workout: Workout;
}
