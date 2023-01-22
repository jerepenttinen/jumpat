import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("exercise")
export class ExerciseModel {
  @PrimaryGeneratedColumn("increment")
  id: number;

  @Column("text")
  name: string;
}
