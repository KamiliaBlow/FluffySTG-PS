import { Button, Stack } from '../../../../../../components';
import {
  CheckboxInput,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureNumberInput,
  FeatureNumeric,
  FeatureToggle,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

const FeatureBlooperDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData>,
) => {
  return (
    <Stack>
      <Stack.Item grow>
        <FeatureDropdownInput buttons {...props} />
      </Stack.Item>
      <Stack.Item>
        <Button
          onClick={() => {
            props.act('play_blooper');
          }}
          icon="play"
          width="100%"
          height="88%"
        />
      </Stack.Item>
    </Stack>
  );
};

export const blooper_speech: FeatureChoiced = {
  name: 'Персонаж - голос',
  component: FeatureBlooperDropdownInput,
};

export const blooper_speech_speed: FeatureNumeric = {
  name: 'Персонаж - голос скор.',
  component: FeatureNumberInput,
};

export const blooper_speech_pitch: FeatureNumeric = {
  name: 'Персонаж - голос выс.',
  component: FeatureNumberInput,
};

export const blooper_pitch_range: FeatureNumeric = {
  name: 'Персонаж - голос диап.',
  component: FeatureNumberInput,
};

export const hear_sound_blooper: FeatureToggle = {
  name: 'Enable blooper hearing',
  category: 'SOUND',
  component: CheckboxInput,
};

export const send_sound_blooper: FeatureToggle = {
  name: 'Enable blooper sending',
  category: 'SOUND',
  component: CheckboxInput,
};
