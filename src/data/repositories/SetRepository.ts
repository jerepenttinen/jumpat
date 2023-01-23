import { DataSource, Repository } from "typeorm";

import { SetModel } from "../entities/SetModel";

export class WorkoutRepository {
  private ormRepository: Repository<SetModel>;

  constructor(dataSource: DataSource) {
    this.ormRepository = dataSource.getRepository(SetModel);
  }

  public async create() {
    const set = this.ormRepository.create();

    await this.ormRepository.save(set);

    return set;
  }
}
