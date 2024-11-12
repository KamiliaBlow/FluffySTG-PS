// THIS IS A NOVA SECTOR UI FILE
import { FeatureChoiced } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const antag_opt_in_status_pref: FeatureChoiced = {
  name: 'Быть целью антагониста',
  description:
    'Это нужно для определения цели и согласия OOC.\
    Кроме того, выбрав «Round Remove», вы сможете быть удалены в соответствующих ситуациях, даже неантагонистами. \
    Включение любых антагов, не относящихся к призракам, \
    (ревенант, подрядчик-похититель и т.д.) заставит вашего опонента испытывать, \
    как минимум, \'Временное неудобство\'.',
  component: FeatureDropdownInput,
};
