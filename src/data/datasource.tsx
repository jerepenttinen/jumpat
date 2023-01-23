import React, {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
} from "react";
import { ActivityIndicator } from "react-native-paper";
import { DataSource } from "typeorm";

import { ExerciseModel } from "./entities/ExerciseModel";
import { RepetitionModel } from "./entities/RepetitionModel";
import { SetModel } from "./entities/SetModel";
import { WorkoutModel } from "./entities/WorkoutModel";
import { ExerciseRepository } from "./repositories/ExerciseRepository";
import { RepetitionRepository } from "./repositories/RepetitionRepository";
import { SetRepository } from "./repositories/SetRepository";
import { WorkoutRepository } from "./repositories/WorkoutRepository";

type DataSourceContextData = {
  exerciseRepository: ExerciseRepository;
  workoutRepository: WorkoutRepository;
  setRepository: SetRepository;
  repetitionRepository: RepetitionRepository;
};

const DataSourceContext = createContext<DataSourceContextData>(
  {} as DataSourceContextData,
);

export function DataSourceContextProvider({
  children,
}: {
  children: React.ReactElement | null;
}) {
  const [dataSource, setDataSource] = useState<DataSource | null>(null);

  const connect = useCallback(async () => {
    const createdDataSource = new DataSource({
      database: "jumppa.db",
      driver: require("expo-sqlite"),
      type: "expo",
      entities: [ExerciseModel, RepetitionModel, SetModel, WorkoutModel],
      synchronize: true,
    });

    setDataSource(await createdDataSource.initialize());
  }, []);

  useEffect(() => {
    if (!dataSource) {
      connect();
    }
  }, [connect, dataSource]);

  if (!dataSource) {
    return <ActivityIndicator />;
  }

  return (
    <DataSourceContext.Provider
      value={{
        exerciseRepository: new ExerciseRepository(dataSource),
        workoutRepository: new WorkoutRepository(dataSource),
        setRepository: new SetRepository(dataSource),
        repetitionRepository: new RepetitionRepository(dataSource),
      }}
    >
      {children}
    </DataSourceContext.Provider>
  );
}

export function useDataSource() {
  const context = useContext(DataSourceContext);
  return context;
}
