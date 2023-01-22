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
import { ExerciseRepository } from "./repositories/ExerciseRepository";

type DataSourceContextData = {
  exerciseRepository: ExerciseRepository;
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
      entities: [ExerciseModel],
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
