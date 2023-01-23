import { DataSource, Repository } from "typeorm";

import { SetModel } from "../entities/SetModel";

export class SetRepository {
  private ormRepository: Repository<SetModel>;

  constructor(dataSource: DataSource) {
    this.ormRepository = dataSource.getRepository(SetModel);
  }

  public async create(workoutId: number) {
    const set = this.ormRepository.create({ workout: { id: workoutId } });
    return await this.ormRepository.save(set);
  }

  public async findById(setId: number) {
    return await this.ormRepository.findOneByOrFail({ id: setId });
  }

  public async updateWeight(setId: number, weight: number) {
    return await this.ormRepository.update({ id: setId }, { weight });
  }
}
