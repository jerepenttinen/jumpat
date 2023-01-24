import { DataSource, Repository } from "typeorm";

import { WorkoutModel } from "../entities/WorkoutModel";

export class WorkoutRepository {
  private ormRepository: Repository<WorkoutModel>;

  constructor(dataSource: DataSource) {
    this.ormRepository = dataSource.getRepository(WorkoutModel);
  }

  public async getAll() {
    return await this.ormRepository.find();
  }

  public async create() {
    const workout = this.ormRepository.create();

    await this.ormRepository.save(workout);

    return workout;
  }

  public async save(workout: WorkoutModel) {
    await this.ormRepository.save(workout);
  }

  public async delete(id: number) {
    await this.ormRepository.delete(id);
  }

  public async findById(workoutId: number) {
    return await this.ormRepository.findOneOrFail({
      where: { id: workoutId },
      relations: ["sets"],
    });
  }
}
