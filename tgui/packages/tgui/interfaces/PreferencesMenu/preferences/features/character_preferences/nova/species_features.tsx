// THIS IS A NOVA SECTOR UI FILE
import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureColorInput,
  FeatureNumberInput,
  FeatureShortTextInput,
  FeatureTextInput,
  FeatureToggle,
  FeatureTriBoolInput,
  FeatureTriColorInput,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const feature_leg_type: FeatureChoiced = {
  name: 'Ноги - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor2: Feature<string> = {
  name: 'Mutant color 2',
  component: FeatureColorInput,
};
export const feature_mcolor3: Feature<string> = {
  name: 'Mutant color 3',
  component: FeatureColorInput,
};

export const flavor_text: Feature<string> = {
  name: 'Общее описание',
  description:
    "Появляется при осмотре персонажа (но только если его можно опознать - например если он без противогаза).",
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: 'Общее описание (Синтетик)',
  description: "Появляется, только если вы играете за борга/ИИ.",
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: 'Заметки OOC',
  component: FeatureTextInput,
};

export const character_ad: Feature<string> = {
  name: 'Персонаж - предпочтения',
  description:
    'Предпочтения вашего персонажа. Дайте информацию о том, как обратиться к заинтересовавшимся, как для обычных, так и для эротических ролевых игр.',
  component: FeatureTextInput,
};

export const attraction: FeatureChoiced = {
  name: 'Персонаж - ориентация',
  description:
    'Кого предпочитает ваш персонаж. Это отображается в Справке.',
  component: FeatureDropdownInput,
};

export const display_gender: FeatureChoiced = {
  name: 'Гендер',
  description:
    'Что классифицируется как пол для вашего персонажа. Это отображается в Справке.',
  component: FeatureDropdownInput,
};

export const custom_species: Feature<string> = {
  name: 'Кастомный вид - название',
  description:
    'Появляется при осмотре. Если оставить это поле пустым, вы будете использовать название вида по умолчанию (например, человек, людоящер).',
  component: FeatureShortTextInput,
};

export const custom_species_lore: Feature<string> = {
  name: 'Кастомный вид - лор',
  description: "Не отображается, если нет кастомных видов.",
  component: FeatureTextInput,
};
export const general_record: Feature<string> = {
  name: 'Записи - Общее',
  description:
    'Просмотр доступен всем. \
    Для общего просмотра - такие вещи, как занятость, квалификация и т.д.',
  component: FeatureTextInput,
};

export const security_record: Feature<string> = {
  name: 'Записи - Безопасность',
  description:
    'Просмотр возможен при наличии доступа безопасности. \
  Судимости, история арестов и тому подобное.',
  component: FeatureTextInput,
};

export const medical_record: Feature<string> = {
  name: 'Записи - Медицинские',
  description:
    'Просмотр возможен при наличии медицинского доступа. \
  Для таких вещей, как история болезни, рецепты, распоряжения DNR и т.д.',
  component: FeatureTextInput,
};

export const exploitable_info: Feature<string> = {
  name: 'Записи - Видимое',
  description:
    'Может быть IC или OOC. Доступно для просмотра некоторым антагонистам/ОС пользователям, а также призракам. Обычно содержит \
  такие вещи, как слабые и сильные стороны, важную предысторию, триггерные слова и т.д. А ТАКЖЕ может содержать такие вещи \
  как предпочтения антагониста, например, хотите ли вы, чтобы с вами враждовали, кто, с чем и т.д.',
  component: FeatureTextInput,
};

export const background_info: Feature<string> = {
  name: 'Записи - Предыстория',
  description:
    'Доступно только вам и призракам. Вы можете разместить здесь все, что захотите - это может быть ценно как способ сориентироваться в том, что представляет собой ваш персонаж.',
  component: FeatureTextInput,
};

export const pda_ringer: Feature<string> = {
  name: 'PDA Ringer Message',
  description:
    'Want your PDA to say something other than "beep"? Accepts the first 20 characters.',
  component: FeatureShortTextInput,
};

export const allow_mismatched_parts_toggle: FeatureToggle = {
  name: 'Несовпадающие части тела',
  description: 'Разрешает использование частей тел других видов.',
  component: CheckboxInput,
};

export const allow_mismatched_hair_color_toggle: FeatureToggle = {
  name: 'Несовпадающий цвет волос',
  description:
    'Позволяет видам, которые обычно имеют фиксированный цвет волос, иметь разные цвета волос. Это включает в себя такие способы, как окрашивание волос, изменение формы и т. д. В настоящее время применимо только к слизням.',
  component: CheckboxInput,
};

export const allow_genitals_toggle: FeatureToggle = {
  name: 'Гениталии',
  description: 'Включите если хотите отобразить их на персонаже.',
  component: CheckboxInput,
};

export const allow_emissives_toggle: FeatureToggle = {
  name: 'Свечение конечностей',
  description: 'Свечение в темноте отдельных частей тела.',
  component: CheckboxInput,
};

export const eye_emissives: FeatureToggle = {
  name: 'Свечение глаз',
  description: 'Позволяет глазам светиться в темноте.',
  component: CheckboxInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: 'Кожа - цвет',
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: 'Таттуировки',
  component: CheckboxInput,
};

export const feature_body_markings: Feature<string> = {
  name: 'Таттуировки - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const body_markings_color: Feature<string[]> = {
  name: 'Таттуировки - цвет',
  component: FeatureTriColorInput,
};

export const body_markings_emissive: Feature<boolean[]> = {
  name: 'Таттуировки - свечение',
  component: FeatureTriBoolInput,
};

export const tail_toggle: FeatureToggle = {
  name: 'Хвост',
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: 'Хвост - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const tail_color: Feature<string[]> = {
  name: 'Хвост - цвет',
  component: FeatureTriColorInput,
};

export const tail_emissive: Feature<boolean[]> = {
  name: 'Хвост - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const snout_toggle: FeatureToggle = {
  name: 'Морда',
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: 'Морда - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const snout_color: Feature<string[]> = {
  name: 'Морда - цвет',
  component: FeatureTriColorInput,
};

export const snout_emissive: Feature<boolean[]> = {
  name: 'Морда - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const horns_toggle: FeatureToggle = {
  name: 'Рога',
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: 'Рога - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const horns_color: Feature<string[]> = {
  name: 'Рога - цвет',
  component: FeatureTriColorInput,
};

export const horns_emissive: Feature<boolean[]> = {
  name: 'Рога - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const ears_toggle: FeatureToggle = {
  name: 'Уши',
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: 'Уши - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ears_color: Feature<string[]> = {
  name: 'Уши - цвет',
  component: FeatureTriColorInput,
};

export const ears_emissive: Feature<boolean[]> = {
  name: 'Уши - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const wings_toggle: FeatureToggle = {
  name: 'Крылья',
  component: CheckboxInput,
};

export const feature_wings: Feature<string> = {
  name: 'Крылья - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const wings_color: Feature<string[]> = {
  name: 'Крылья - цвет',
  component: FeatureTriColorInput,
};

export const wings_emissive: Feature<boolean[]> = {
  name: 'Крылья - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const frills_toggle: FeatureToggle = {
  name: 'Капюшон',
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: 'Капюшон - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const frills_color: Feature<string[]> = {
  name: 'Капюшон - цвет',
  component: FeatureTriColorInput,
};

export const frills_emissive: Feature<boolean[]> = {
  name: 'Капюшон - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const spines_toggle: FeatureToggle = {
  name: 'Шипы',
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: 'Шипы - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const spines_color: Feature<string[]> = {
  name: 'Шипы - цвет',
  component: FeatureTriColorInput,
};

export const spines_emissive: Feature<boolean[]> = {
  name: 'Шипы - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const digitigrade_legs: FeatureChoiced = {
  name: 'Ноги',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_toggle: FeatureToggle = {
  name: 'Шляпка',
  component: CheckboxInput,
};

export const feature_caps: Feature<string> = {
  name: 'Шляпка - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_color: Feature<string[]> = {
  name: 'Шляпка - цвет',
  component: FeatureTriColorInput,
};

export const caps_emissive: Feature<boolean[]> = {
  name: 'Шляпка - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const moth_antennae_toggle: FeatureToggle = {
  name: 'Усики мотылька',
  component: CheckboxInput,
};

export const feature_moth_antennae: Feature<string> = {
  name: 'Усики мотылька - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_antennae_color: Feature<string[]> = {
  name: 'Усики мотылька - цвет',
  component: FeatureTriColorInput,
};

export const moth_antennae_emissive: Feature<boolean[]> = {
  name: 'Усики мотылька - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const moth_markings_toggle: FeatureToggle = {
  name: 'Moth Markings',
  component: CheckboxInput,
};

export const feature_moth_markings: Feature<string> = {
  name: 'Moth Markings Selection',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_markings_color: Feature<string[]> = {
  name: 'Moth Markings Colors',
  component: FeatureTriColorInput,
};

export const moth_markings_emissive: Feature<boolean[]> = {
  name: 'Moth Markings Emissives',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const fluff_toggle: FeatureToggle = {
  name: 'Мех',
  component: CheckboxInput,
};

export const feature_fluff: Feature<string> = {
  name: 'Мех - вид',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const fluff_color: Feature<string[]> = {
  name: 'Мех - цвет',
  component: FeatureTriColorInput,
};

export const fluff_emissive: Feature<boolean[]> = {
  name: 'Мех - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const head_acc_toggle: FeatureToggle = {
  name: 'Head Accessories',
  component: CheckboxInput,
};

export const feature_head_acc: Feature<string> = {
  name: 'Head Accessories Selection',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const head_acc_color: Feature<string[]> = {
  name: 'Head Accessories Colors',
  component: FeatureTriColorInput,
};

export const head_acc_emissive: Feature<boolean[]> = {
  name: 'Head Accessories Emissives',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_screen: Feature<string> = {
  name: 'IPC Screen Selection',
  description: 'Can be changed in-round.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_screen_color: Feature<string> = {
  name: 'IPC Screen Greyscale Color',
  component: FeatureColorInput,
};

export const ipc_screen_emissive: Feature<boolean> = {
  name: 'IPC Screen Emissive',
  description: 'Emissive parts glow in the dark.',
  component: CheckboxInput,
};

export const ipc_antenna_toggle: FeatureToggle = {
  name: 'Антенна синта',
  component: CheckboxInput,
};

export const feature_ipc_antenna: Feature<string> = {
  name: 'Антенна синта - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_antenna_color: Feature<string[]> = {
  name: 'Антенна синта - цвет',
  component: FeatureTriColorInput,
};

export const ipc_antenna_emissive: Feature<boolean[]> = {
  name: 'Антенна синта - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_chassis: Feature<string> = {
  name: 'Шасси синта - тип',
  description: 'Работает только для синтов.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_chassis_color: Feature<string> = {
  name: 'Шасси синта - цвет',
  description:
    'Работает только для синтов и шасси, поддерживающих раскраску в серые тона.',
  component: FeatureColorInput,
};

export const feature_ipc_head: Feature<string> = {
  name: 'Голова синта - тип',
  description: 'Работает только для синтов.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_head_color: Feature<string> = {
  name: 'Голова синта - цвет',
  component: FeatureColorInput,
};

export const feature_hair_opacity_toggle: Feature<boolean> = {
  name: 'Прическа - прозрачность',
  component: CheckboxInput,
};

export const feature_hair_opacity: Feature<number> = {
  name: 'Прическая - уровень прозрасности',
  component: FeatureNumberInput,
};

export const neck_acc_toggle: FeatureToggle = {
  name: 'Neck Accessories',
  component: CheckboxInput,
};

export const feature_neck_acc: Feature<string> = {
  name: 'Neck Accessories Selection',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const neck_acc_color: Feature<string[]> = {
  name: 'Neck Accessories Colors',
  component: FeatureTriColorInput,
};

export const neck_acc_emissive: Feature<boolean[]> = {
  name: 'Neck Accessories Emissives',
  component: FeatureTriBoolInput,
};

export const skrell_hair_toggle: FeatureToggle = {
  name: 'Прическа скрелла',
  component: CheckboxInput,
};

export const feature_skrell_hair: Feature<string> = {
  name: 'Прическа скрелла - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const skrell_hair_color: Feature<string[]> = {
  name: 'Прическа скрелла - цвет',
  component: FeatureTriColorInput,
};

export const skrell_hair_emissive: Feature<boolean[]> = {
  name: 'Прическа скрелла - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const taur_toggle: FeatureToggle = {
  name: 'Тавр',
  component: CheckboxInput,
};

export const feature_taur: Feature<string> = {
  name: 'Тавр - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const taur_color: Feature<string[]> = {
  name: 'Тавр - цвет',
  component: FeatureTriColorInput,
};

export const taur_emissive: Feature<boolean[]> = {
  name: 'Тавр - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const naga_sole: FeatureToggle = {
  name: 'Тавр - (Нага) disable hardened soles',
  description:
    'If using a serpentine taur body, determines if you are immune to caltrops and a few other effects of being barefoot.',
  component: CheckboxInput,
};

export const xenodorsal_toggle: FeatureToggle = {
  name: 'Ксенодыхало',
  component: CheckboxInput,
};

export const feature_xenodorsal: Feature<string> = {
  name: 'Ксенодыхало - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenodorsal_color: Feature<string[]> = {
  name: 'Ксенодыхало - цвет',
  component: FeatureTriColorInput,
};

export const xenodorsal_emissive: Feature<boolean[]> = {
  name: 'Ксенодыхало - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const xenohead_toggle: FeatureToggle = {
  name: 'Ксеноголова',
  component: CheckboxInput,
};

export const feature_xenohead: Feature<string> = {
  name: 'Ксеноголова - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenohead_color: Feature<string[]> = {
  name: 'Ксеноголова - цвет',
  component: FeatureTriColorInput,
};

export const xenohead_emissive: Feature<boolean[]> = {
  name: 'Ксеноголова - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const undershirt_color: Feature<string> = {
  name: 'Undershirt color',
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: 'Socks color',
  component: FeatureColorInput,
};

export const heterochromia_toggle: FeatureToggle = {
  name: 'Гетерохромия',
  component: CheckboxInput,
};

export const feature_heterochromia: Feature<string> = {
  name: 'Гетерохромия - тип',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const heterochromia_color: Feature<string[]> = {
  name: 'Гетерохромия - цвет',
  component: FeatureTriColorInput,
};

export const heterochromia_emissive: Feature<boolean[]> = {
  name: 'Гетерохромия - свечение',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const vox_bodycolor: Feature<string> = {
  name: 'Vox Bodycolor',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const pod_hair_color: Feature<string[]> = {
  name: 'Floral Hair Color',
  component: FeatureTriColorInput,
};

export const pod_hair_emissive: Feature<boolean> = {
  name: 'Floral Hair Emissive',
  description: 'Emissive parts glow in the dark.',
  component: CheckboxInput,
};
