import { DataSource, Repository } from "typeorm";

import { ExerciseModel } from "../entities/ExerciseModel";

type CreateExerciseData = {
  name: string;
};

export class ExerciseRepository {
  private ormRepository: Repository<ExerciseModel>;

  constructor(dataSource: DataSource) {
    this.ormRepository = dataSource.getRepository(ExerciseModel);
  }

  public async getAll() {
    return await this.ormRepository.find();
  }

  public async create({ name }: CreateExerciseData) {
    const exercise = this.ormRepository.create({
      name,
    });

    await this.ormRepository.save(exercise);

    return exercise;
  }

  public async delete(id: number) {
    await this.ormRepository.delete(id);
  }
}
