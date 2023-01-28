import dayjs from "dayjs";
import React, { createContext, useCallback, useContext } from "react";
import { useTranslation } from "react-i18next";

type AppLocaleContextData = {
  handleChangeLocale(language: string): void;
  formatDate(date: Date): string;
};

const AppLocaleContext = createContext<AppLocaleContextData>(
  {} as AppLocaleContextData,
);

function AppLocaleProvider({
  children,
}: {
  children: React.ReactElement | null;
}) {
  const { i18n } = useTranslation();
  const handleChangeLocale = useCallback(
    (language: string) => {
      i18n.changeLanguage(language);
    },
    [i18n],
  );

  const formatDate = useCallback(
    (date: Date) => dayjs(date).format("dddd L"),
    [i18n],
  );

  return (
    <AppLocaleContext.Provider value={{ handleChangeLocale, formatDate }}>
      {children}
    </AppLocaleContext.Provider>
  );
}

const useAppLocale = (): AppLocaleContextData => {
  const context = useContext(AppLocaleContext);

  if (!context) {
    throw new Error("useAppLocale must be used within an AppLocaleProvider");
  }

  return context;
};

export { AppLocaleProvider, useAppLocale };
