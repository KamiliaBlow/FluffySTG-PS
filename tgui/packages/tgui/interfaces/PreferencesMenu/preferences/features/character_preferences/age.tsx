import { Feature, FeatureNumberInput } from '../base';

export const age: Feature<number> = {
  // name: 'Age', // ORIGINAL
  name: 'Возраст (Физический)', // NOVA EDIT CHANGE - Chronological age
  // NOVA EDIT ADDITION BEGIN - Chronological age
  description:
    "Физический возраст представляет, насколько ваш персонаж вырос физически и умственно.\
    Включает 'нормальное' старение, например, опыт, который физически старит тело, и 'антивозрастные' медицинские процедуры.\
    Не включает время, проведенное в крио-сне",
  // NOVA EDIT ADDITION END
  component: FeatureNumberInput,
};
