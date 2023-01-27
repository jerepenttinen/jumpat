import {
  BaseEntity,
  Column,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";

import { Set } from "./Set";

@Entity("exercise")
export class Exercise extends BaseEntity {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "text", unique: true })
  name: string;

  @OneToMany(() => Set, (set) => set.exercise)
  sets: Set[];
}
