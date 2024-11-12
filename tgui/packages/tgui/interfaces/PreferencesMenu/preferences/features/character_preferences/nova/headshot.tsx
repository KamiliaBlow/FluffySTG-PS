// THIS IS A NOVA SECTOR UI FILE
import { Feature, FeatureShortTextInput } from '../../base';

export const headshot: Feature<string> = {
  name: 'Фотография',
  description:
    'Требуется ссылка, заканчивающаяся на .png, .jpeg или .jpg, начинающаяся с \
    https://, и размещена на Gyazo или Discord. Изображение отображается под \
    превью вашего персонажа в окне «Изучить больше». \
    Изображение размером более 250x250 будет уменьшено до 250x250. \
    Стремитесь к 250x250, когда это возможно',
  component: FeatureShortTextInput,
};
