import { CheckboxInput, type FeatureToggle } from '../base';

export const persistent_scars: FeatureToggle = {
  name: 'Постоянные шрамы',
  description:
    'Если этот флажок установлен, шрамы останутся после раунда, если вы доживете до конца.',
  component: CheckboxInput,
};
