import {
  BaseEntity,
  Column,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";

import { Set } from "./Set";

@Entity("repetition")
export class Repetition extends BaseEntity {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "int", nullable: true })
  count: number;

  @Column({ type: "datetime", default: () => "date('now')" })
  createdAt: Date;

  @ManyToOne(() => Set, (set) => set.repetitions, { onDelete: "CASCADE" })
  set: Set;
}
