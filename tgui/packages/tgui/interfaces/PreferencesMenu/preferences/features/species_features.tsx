import {
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureColorInput,
  FeatureValueProps,
} from './base';
import { FeatureDropdownInput } from './dropdowns';

export const eye_color: Feature<string> = {
  name: 'Глаза - цвет',
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: 'Лицевая растительность - цвет',
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: 'Лицевая растительность - градиент',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const facial_hair_gradient_color: Feature<string> = {
  name: 'Лицевая растительность - цвет градиента',
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: 'Прическа - цвет',
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: 'Прическа - градиент',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const hair_gradient_color: Feature<string> = {
  name: 'Прическа - цвет градиента',
  component: FeatureColorInput,
};

export const feature_human_ears: FeatureChoiced = {
  name: 'Уши',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_human_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_monkey_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_legs: FeatureChoiced = {
  name: 'Ноги',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_spines: FeatureChoiced = {
  name: 'Spines',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor: Feature<string> = {
  name: 'Mutant color',
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: 'Underwear color',
  component: FeatureColorInput,
};

export const bra_color: Feature<string> = {
  name: 'Bra color',
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: 'Vampire status',
  component: FeatureDropdownInput,
};

export const heterochromatic: Feature<string> = {
  name: 'Heterochromatic (Right Eye) color',
  component: FeatureColorInput,
};
