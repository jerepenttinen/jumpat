import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

import { SetModel } from "./SetModel";

@Entity("repetition")
export class RepetitionModel {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column({ type: "int", nullable: true })
  count: number;

  @Column({ type: "datetime", default: () => "date('now')" })
  createdAt: Date;

  @ManyToOne(() => SetModel, (set) => set.repetitions)
  set: SetModel;
}
