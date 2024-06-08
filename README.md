# reto pragma fase1

## arquitectura

este reto fue realizado utilizando clean architecture, fue realizado utilizando la metodología DDD (domain-diven-desing)

estructura:
- common
    - utils -> funciones de ayuda generales de la app
- data
    - datasource -> aqui se guardan todos los datos locales de la app
    - repository_implementaction -> esta es la implementación del repositorio, esta capa es la única que puede alterar el datasource
- domain
    - models -> en esta capa se tiene los modelos de datos utilizados en la app
    - repositories -> esta es una capa de de abstracción que permite a domain conocer cuales son los métodos del repositorio
    - use_cases -> esta capa contiene lógica de negocios, puede llamar al repository para realizar acciones con los datos
- presentation
    - bloc -> esta capa que se comunica con el dominio y conviene los datos en streams para su consumo en los widgets
    - global -> aquí se tienen widgets que se usan en toda la app y los colores de la app
    - modules -> en esta capa se almacenan todas las vistas separadas por capas independientes
    - routes -> esta capa contiene la información necesaria para la navegación

## Instalación 🔧

### _1. clone el repositorio_

```
git clone https://github.com/majiar15/pragma-fase1
```

### _2. instale los paquetes_

```
flutter pub get
```

### _3. encendemos la aplicacion_

```
flutter run
```


