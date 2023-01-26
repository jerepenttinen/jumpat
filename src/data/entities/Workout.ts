import {
  BaseEntity,
  Column,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";

import { Set } from "./Set";

@Entity("workout")
export class Workout extends BaseEntity {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "datetime", default: () => "date('now')" })
  createdAt: Date;

  @OneToMany(() => Set, (set) => set.workout)
  sets: Set[];
}
