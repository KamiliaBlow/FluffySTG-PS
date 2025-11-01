// THIS IS A NOVA SECTOR UI FILE
import { Feature, FeatureShortTextInput } from '../../base';

const description =
  'Требуется ссылка, заканчивающаяся на .png, .jpeg или .jpg, начинающаяся с \
  https://, и размещена на Gyazo или Discord. Изображение отображается под \
  превью вашего персонажа в окне «Изучить больше». \
  Изображение размером более 250x250 будет уменьшено до 250x250. \
  Стремитесь к 250x250, когда это возможно';

export const headshot: Feature<string> = {
  name: 'Портрет',
  description: description,
  component: FeatureShortTextInput,
};

export const silicon_headshot: Feature<string> = {
  name: 'Портрет (Синтетик)',
  description: description,
  component: FeatureShortTextInput,
};
