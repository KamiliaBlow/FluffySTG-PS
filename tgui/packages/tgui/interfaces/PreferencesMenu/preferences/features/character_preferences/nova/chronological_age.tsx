// THIS IS A NOVA SECTOR UI FILE
import { Feature, FeatureNumberInput } from '../../base';

export const chrono_age: Feature<number> = {
  name: 'Возраст (Хронологический)',
  description:
    'Хронологический возраст представляет собой то, сколько времени ваш персонаж фактически просуществовал во вселенной с момента рождения.\
    Включает время, проведенное в крио-сне и/или в зонах гравитационного/скоростного замедления времени.',
  component: FeatureNumberInput,
};
