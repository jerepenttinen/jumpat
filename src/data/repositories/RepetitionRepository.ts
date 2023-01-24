import { DataSource, Repository } from "typeorm";

import { RepetitionModel } from "../entities/RepetitionModel";

export class RepetitionRepository {
  private ormRepository: Repository<RepetitionModel>;

  constructor(dataSource: DataSource) {
    this.ormRepository = dataSource.getRepository(RepetitionModel);
  }

  public async create(setId: number) {
    const rep = this.ormRepository.create({ set: { id: setId } });
    return await this.ormRepository.save(rep);
  }

  public async updateCount(repetitionId: number, newCount: number) {
    return await this.ormRepository.update(
      { id: repetitionId },
      { count: newCount },
    );
  }
}
