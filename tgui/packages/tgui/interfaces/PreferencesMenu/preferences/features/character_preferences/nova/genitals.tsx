// THIS IS A NOVA SECTOR UI FILE
import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureNumberInput,
  FeatureNumeric,
  FeatureToggle,
  FeatureTriBoolInput,
  FeatureTriColorInput,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const feature_penis: Feature<string> = {
  name: 'Пенис',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const penis_skin_tone: FeatureToggle = {
  name: 'Пенис под тон кожи',
  component: CheckboxInput,
};

export const penis_skin_color: FeatureToggle = {
  name: 'Пенис под цвет кожи',
  component: CheckboxInput,
};

export const penis_color: Feature<string[]> = {
  name: 'Пенис - цвет',
  component: FeatureTriColorInput,
};

export const penis_emissive: Feature<boolean[]> = {
  name: 'Пенис - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const penis_sheath: Feature<string> = {
  name: 'Penis Sheath',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const penis_length: FeatureNumeric = {
  name: 'Penis Length',
  description:
    'Value is measured in inches.\
     This value is limited to 20 for characters with a body size <= 1, \
     or without the oversized trait. The maximum allowed value scales up\
     based on the body size of a character, up to a max of 36.',
  component: FeatureNumberInput,
};

export const penis_girth: FeatureNumeric = {
  name: 'Penis Girth',
  description:
    'Value is circumference, measured in inches.\
    This value is limited to 15 for characters with a body size <= 1, \
    or without the oversized trait. The maximum allowed value scales up\
    based on the body size of a character, up to a max of 20.',
  component: FeatureNumberInput,
};

export const penis_taur_mode_toggle: FeatureToggle = {
  name: 'Penis Taur Mode',
  description:
    'If the chosen taur body has a penis sprite, it will be used \
    instead of the usual.',
  component: CheckboxInput,
};

export const feature_testicles: Feature<string> = {
  name: 'Тестикулы',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const testicles_skin_tone: FeatureToggle = {
  name: 'Тестикулы под тон кожи',
  component: CheckboxInput,
};

export const testicles_skin_color: FeatureToggle = {
  name: 'Тестикулы под цвет кожи',
  component: CheckboxInput,
};

export const testicles_color: Feature<string[]> = {
  name: 'Тестикулы - цвет',
  component: FeatureTriColorInput,
};

export const testicles_emissive: Feature<boolean[]> = {
  name: 'Тестикулы - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const balls_size: FeatureNumeric = {
  name: 'Тестикулы - размер',
  component: FeatureNumberInput,
};

export const feature_vagina: Feature<string> = {
  name: 'Вагина',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const vagina_skin_tone: FeatureToggle = {
  name: 'Вагина под тон кожи',
  component: CheckboxInput,
};

export const vagina_skin_color: FeatureToggle = {
  name: 'Вагина под цвет кожи',
  component: CheckboxInput,
};

export const vagina_color: Feature<string[]> = {
  name: 'Вагина - цвет',
  component: FeatureTriColorInput,
};

export const vagina_emissive: Feature<boolean[]> = {
  name: 'Вагина - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const feature_womb: Feature<string> = {
  name: 'Матка',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_breasts: Feature<string> = {
  name: 'Грудь',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const breasts_skin_tone: FeatureToggle = {
  name: 'Грудь под тон кожи',
  component: CheckboxInput,
};

export const breasts_skin_color: FeatureToggle = {
  name: 'Грудь под цвет кожи',
  component: CheckboxInput,
};

export const breasts_color: Feature<string[]> = {
  name: 'Грудь - цвет',
  component: FeatureTriColorInput,
};

export const breasts_emissive: Feature<boolean[]> = {
  name: 'Грудь - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const breasts_lactation_toggle: FeatureToggle = {
  name: 'Грудь - лактация',
  component: CheckboxInput,
};

export const breasts_size: Feature<string> = {
  name: 'Грудь - размер',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_anus: Feature<string> = {
  name: 'Анус',
  component: FeatureDropdownInput,
};

export const body_size: FeatureNumeric = {
  name: 'Тело - размер',
  component: FeatureNumberInput,
};

export const erp_status_pref: FeatureChoiced = {
  name: 'ЭРИ - Статус',
  description:
    'Все предпочтения по статусу ЭРИ являются лишь маркерами для других игроков \
  что вы предпочитаете различные широкие категории ЭРИ. Выбор «нет» практически изолирует вас от \
  всех видов ЭРИ.',
  component: FeatureDropdownInput,
};

export const erp_status_pref_nc: FeatureChoiced = {
  name: 'ЭРИ - Нон-кон (статус)',
  component: FeatureDropdownInput,
};

export const erp_status_pref_v: FeatureChoiced = {
  name: 'ЭРИ - Воре (статус)',
  component: FeatureDropdownInput,
};

export const erp_status_pref_hypnosis: FeatureChoiced = {
  name: 'ЭРИ - Гипноз (статус)',
  component: FeatureDropdownInput,
};

export const erp_status_pref_mechanics: FeatureChoiced = {
  name: 'ЭРИ - Механ (статус)',
  component: FeatureDropdownInput,
};
