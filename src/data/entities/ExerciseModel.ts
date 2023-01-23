import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";

import { SetModel } from "./SetModel";

@Entity("exercise")
export class ExerciseModel {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column("text")
  name: string;

  @OneToMany(() => SetModel, (set) => set.exercise)
  sets: SetModel[];
}
