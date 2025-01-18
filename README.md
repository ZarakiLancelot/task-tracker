# Task Tracker CLI

**Task Tracker CLI** es una herramienta de línea de comandos para gestionar tus tareas. Puedes agregar, actualizar, eliminar y cambiar el estado de tus tareas, además de listarlas por diferentes criterios.

## Características

- **Agregar tareas**: Crea tareas nuevas con una descripción.
- **Actualizar tareas**: Modifica la descripción de tareas existentes.
- **Eliminar tareas**: Elimina tareas específicas.
- **Cambiar estado**: Marca las tareas como en progreso o completadas.
- **Listar tareas**: Muestra todas las tareas o filtra por estado (`todo`, `in-progress`, `done`).

## Requisitos

- Ruby 3.0 o superior.

## Instalación

1. Clona este repositorio:

   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd task_tracker
   ```

2. Asegúrate de tener Ruby instalado. Puedes verificarlo ejecutando:

   ```bash
   ruby --version
   ```

## Uso

La aplicación se ejecuta desde la línea de comandos. Aquí están los comandos disponibles:

### Agregar una tarea

```bash
ruby task_tracker.rb add "Descripción de la tarea"
```

**Ejemplo:**

```bash
ruby task_tracker.rb add "Comprar leche"
```

### Listar tareas

- Todas las tareas:

  ```bash
  ruby task_tracker.rb list
  ```

- Filtrar por estado (`todo`, `in-progress`, `done`):
  
  ```bash
  ruby task_tracker.rb list done
  ```

### Actualizar una tarea

```bash
ruby task_tracker.rb update <ID> "Nueva descripción"
```

**Ejemplo:**

```bash
ruby task_tracker.rb update 1 "Comprar leche y huevos"
```

### Eliminar una tarea

```bash
ruby task_tracker.rb delete <ID>
```

**Ejemplo:**

```bash
ruby task_tracker.rb delete 1
```

### Marcar una tarea como en progreso

```bash
ruby task_tracker.rb mark-in-progress <ID>
```

**Ejemplo:**

```bash
ruby task_tracker.rb mark-in-progress 1
```

### Marcar una tarea como completada

```bash
ruby task_tracker.rb complete <ID>
```

**Ejemplo:**

```bash
ruby task_tracker.rb complete 1
```

## Estructura de las Tareas

Cada tarea tiene las siguientes propiedades:

- `id`: Identificador único de la tarea.
- `description`: Descripción breve de la tarea.
- `status`: Estado de la tarea (`todo`, `in-progress`, `done`).
- `createdAt`: Fecha y hora de creación.
- `updatedAt`: Fecha y hora de la última actualización.

## Notas

- Las tareas se almacenan en un archivo `tasks.json` ubicado en el directorio actual.
- Si el archivo `tasks.json` no existe, se creará automáticamente al ejecutar la aplicación.

## Contribuciones

¡Las contribuciones son bienvenidas! Por favor, crea un fork de este repositorio, realiza tus cambios y envía un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.
