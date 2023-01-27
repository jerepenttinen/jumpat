import React, { createContext, useCallback, useContext } from "react";
import { useTranslation } from "react-i18next";

type AppLocaleContextData = {
  handleChangeLocale(language: string): void;
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

  return (
    <AppLocaleContext.Provider value={{ handleChangeLocale }}>
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
