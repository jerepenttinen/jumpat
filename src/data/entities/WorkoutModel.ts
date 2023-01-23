import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";

import { SetModel } from "./SetModel";

@Entity("workout")
export class WorkoutModel {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "datetime", default: () => "date('now')" })
  createdAt: Date;

  @OneToMany(() => SetModel, (set) => set.workout)
  sets: SetModel[];
}
