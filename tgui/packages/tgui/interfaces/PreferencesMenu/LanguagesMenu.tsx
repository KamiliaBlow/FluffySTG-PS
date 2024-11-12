// THIS IS A NOVA SECTOR UI FILE
import { useBackend } from '../../backend';
import { Box, Button, Section, Stack } from '../../components';
import { PreferencesMenuData } from './data';

export const KnownLanguage = (props) => {
  const { act } = useBackend<PreferencesMenuData>();
  return (
    <Stack.Item>
      <Section title={props.language.name}>
        {props.language.description}
        <br />
        <Button
          color="bad"
          onClick={() =>
            act('remove_language', { language_name: props.language.name })
          }
        >
          Забыть <Box className={'languages16x16 ' + props.language.icon} />
        </Button>
      </Section>
    </Stack.Item>
  );
};

export const UnknownLanguage = (props) => {
  const { act } = useBackend<PreferencesMenuData>();
  return (
    <Stack.Item>
      <Section title={props.language.name}>
        {props.language.description}
        <br />
        <Button
          color="good"
          onClick={() =>
            act('give_language', { language_name: props.language.name })
          }
        >
          Изучить <Box className={'languages16x16 ' + props.language.icon} />
        </Button>
      </Section>
    </Stack.Item>
  );
};

export const LanguagesPage = (props) => {
  const { data } = useBackend<PreferencesMenuData>();
  return (
    <Stack>
      <Stack.Item minWidth="33%">
        <Section title="Доступные языки">
          <Stack vertical>
            {data.unselected_languages.map((val) => (
              <UnknownLanguage key={val.icon} language={val} />
            ))}
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item minWidth="33%">
        <Section
          title={
            'Очки: ' +
            data.selected_languages.length +
            '/' +
            data.total_language_points
          }
        >
          Здесь вы можете приобрести языки по балльной системе. Каждый
          язык стоит 1 балл.
        </Section>
      </Stack.Item>
      <Stack.Item minWidth="33%">
        <Section title="Известные языки">
          <Stack vertical>
            {data.selected_languages.map((val) => (
              <KnownLanguage key={val.icon} language={val} />
            ))}
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};
