// THIS IS A NOVA SECTOR UI FILE
import { useBackend } from 'tgui/backend';
import { BlockQuote, Box, Button, Section, Stack } from 'tgui-core/components';

import { Language, PreferencesMenuData } from '../types';

export function KnownLanguage(props: { language: Language }) {
  const { act } = useBackend<PreferencesMenuData>();
  return (
    <Stack.Item>
      <Section
        title={
          <>
            <Box
              // Manually putting the icon here instead of using the buttons prop cause it looks better
              mr="2px"
              mb="-4px"
              inline
              className={`languages16x16 ${props.language.icon}`}
            />
            <Box inline>{props.language.name}</Box>
          </>
        }
      >
        <BlockQuote>{props.language.description}</BlockQuote>
        <Button
          color="bad"
          icon="brain"
          tooltip="Забыть, как понимать язык, вы также не сможете на нем говорить."
          onClick={() =>
            act('forget_understand_language', {
              language_name: props.language.name,
            })
          }
        >
          Забыть
        </Button>
        <Button
          color={props.language.speaking ? 'good' : 'default'}
          icon={props.language.speaking ? 'comment' : 'comment-slash'}
          tooltip={
            props.language.speaking
              ? 'Забыть, как говорить на этом языке, но сохранить его понимание.'
              : 'Научиться говорить на этом языке.'
          }
          onClick={() =>
            act(
              props.language.speaking
                ? 'forget_speak_language'
                : 'speak_language',
              { language_name: props.language.name },
            )
          }
        >
          {props.language.speaking ? 'Говорить' : 'Только понимать'}
        </Button>
      </Section>
    </Stack.Item>
  );
}

export function UnknownLanguage(props: { language: Language }) {
  const { act, data } = useBackend<PreferencesMenuData>();
  const noPoints =
    data.selected_languages.length === data.total_language_points;
  return (
    <Stack.Item>
      <Section
        title={
          <>
            <Box
              // Manually putting the icon here instead of using the buttons prop cause it looks better
              mr="2px"
              mb="-3px"
              inline
              className={`languages16x16 ${props.language.icon}`}
            />
            <Box inline>{props.language.name}</Box>
          </>
        }
      >
        <BlockQuote>{props.language.description}</BlockQuote>
        <Button
          color={!noPoints ? 'good' : 'grey'}
          icon="comment"
          tooltip="Научиться говорить и понимать язык."
          onClick={() =>
            act('speak_language', { language_name: props.language.name })
          }
        >
          Говорить
        </Button>
        <Button
          color={!!noPoints && 'grey'}
          icon="brain"
          tooltip="Научиться понимать язык, но не говорить на нем."
          onClick={() =>
            act('understand_language', { language_name: props.language.name })
          }
        >
          Понимать
        </Button>
      </Section>
    </Stack.Item>
  );
}

export function LanguagesPage() {
  const { data } = useBackend<PreferencesMenuData>();
  return (
    <>
      <Section textAlign="center">
        Здесь вы можете изучать языки с помощью системы баллов. Нейтральная особенность <b>Лингвист</b>{' '}
        даст вам один дополнительный балл.
        <br />
        Языки могут быть либо теми <b>на которых говорят и которые понимают</b> либо{' '}
        <b>те которые только понимают.</b>
        <br />
        Один язык стоит <b>1 балл,</b> даже если этот язык только
        понимается, но не говорится.
        <br />
        Вы должны знать хотя бы один язык и понимать язык Sol
        Common чтобы выполнять большинство заданий на станции. <br />
        Переключение речи с одного языка на другой не требует затрат очков,
        очки требуются только для добавления совершенно нового языка.
      </Section>
      <Stack>
        <Stack.Item minWidth="50%">
          <Section
            title={
              <Box fontSize="150%">
                {data.unselected_languages.length} языков доступно
              </Box>
            }
          >
            <Stack vertical>
              {data.unselected_languages.map((val) => (
                <UnknownLanguage key={val.icon} language={val} />
              ))}
            </Stack>
          </Section>
        </Stack.Item>
        <Stack.Item minWidth="50%">
          <Section
            title={
              <Box fontSize="150%">
                {data.selected_languages.length}/{data.total_language_points}{' '}
                известных языков
              </Box>
            }
          >
            <Stack vertical>
              {data.selected_languages.map((val) => (
                <KnownLanguage key={val.icon} language={val} />
              ))}
            </Stack>
          </Section>
        </Stack.Item>
      </Stack>
    </>
  );
}
