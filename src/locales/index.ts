import "intl-pluralrules";
import "dayjs/locale/fi";

import AsyncStorage from "@react-native-async-storage/async-storage";
import dayjs from "dayjs";
import localizedFormat from "dayjs/plugin/localizedFormat";
import * as Localization from "expo-localization";
import i18n, { Module } from "i18next";
import { initReactI18next } from "react-i18next";

import { en, fi } from "./translations";

dayjs.extend(localizedFormat);

const resources = {
  en,
  fi,
};

const languageDetector = {
  type: "languageDetector",
  async: true,
  detect: async (callback: (language: string) => void) => {
    const storedLanguage = await AsyncStorage.getItem("@AppIntl:language");
    if (storedLanguage) {
      dayjs.locale(storedLanguage);
      return callback(storedLanguage);
    }

    const code = Localization.getLocales()[0].languageCode;
    dayjs.locale(code);
    return callback(code);
  },
  init: () => {},
  cacheUserLanguage: (language: string) => {
    AsyncStorage.setItem("@AppIntl:language", language);
  },
};

i18n
  .use(languageDetector as Module)
  .use(initReactI18next)
  .init({
    resources,
    fallbackLng: "en",
    interpolation: {
      escapeValue: false,
    },
  });

export default i18n;
