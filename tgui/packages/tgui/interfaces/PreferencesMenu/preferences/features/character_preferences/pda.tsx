import {
  type Feature,
  type FeatureChoiced,
  FeatureShortTextInput,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const pda_theme: FeatureChoiced = {
  name: 'Тема КПК',
  category: 'GAMEPLAY',
  component: FeatureDropdownInput,
};

export const pda_ringtone: Feature<string> = {
  name: 'Рингтон КПК',
  component: FeatureShortTextInput,
};
