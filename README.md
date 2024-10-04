# Oh my god

## CSS

В качестве основного CSS-фреймворка использую pico.css.
Для его компиляции необходима расширенная версия Hugo и установленный Dart Sass.

* [pico: Minimal CSS Framework for semantic HTML](https://picocss.com/)
  * [picocss/pico - GitHub](https://github.com/picocss/pico)
* [Dart Sass - GitHub](https://github.com/sass/dart-sass)
* [Dart Sass i Hugo](https://gohugo.io/functions/css/sass/#dart-sass)

Есть возможность использовать Bootstrap 5, см. секцию настроек стилей и CSS-фреймворка.

## Настройка стилей и CSS-фреймворка

Настройка используемого CSS-фреймворка осуществляется через файл `params.json` и секцию `"css"`.

```json
"css": {
    "picocss": {
        "use": true,
        "classless": false,
        "fluid": false,
        "version": "2"
    },
    "bootstrap": {
        "use": false,
        "version": "5.3.3"
    },
    "cdn": false
}
```

Кратко об приоритетах и логики за которую отвечает `partial "head/stylesheet"`.
Если свойство `bootstrap.use = true` то приоритет будет отдан CSS-фреймворку Bootstrap.

PicoCSS должен быть активирован явно, через `picocss.use = true` и `bootstrap.use = false`.

`picocss.fluid = true` имеет приоритет над `picocss.classless = true`.

## Настройка Favicons

Настройка favicons заключается в подмене файлов. Подробности в файле `{{ partial "head/favicons" . -}}`.

Разместите файл `favicon.ico` в директории `static`. Подключать favicon.ico в коде страницы избыточно, браузеры и другие приложения запрашивают его автоматически.

Создайте в директории `static` папку `favicons` и пометите в неё необходимые файлы.
Файлы перечисленные ниже будут подключены автоматически, если находятся в указанной директории.

* `favicons/apple-touch-icon-180x180.png`
* `favicons/favicon-16x16.png`
* `favicons/favicon-32x32.png`
* `favicons/android-36x36.png`
* `favicons/android-48x48.png`
* `favicons/android-72x72.png`
* `favicons/android-96x96.png`
* `favicons/android-144x144.png`
* `favicons/android-192x192.png`

Техническая заметка: вызов файла `head/favicons` осуществляется с помощью функции `partialCached`, что значит при появлении новых файлов в директории, закэшированное частичное представление не обновляется и `hugo` нужно перезапустить.
