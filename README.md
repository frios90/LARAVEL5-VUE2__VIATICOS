Sistema de Gestión de Viáticos y Rendición de Gastos
Descripción del Sistema

Sistema backend construido con Laravel 5.6 que expone una API REST para la gestión de viáticos y rendición de gastos. El frontend es una SPA desarrollada con Vue 2 que se consume después de la autenticación inicial manejada por Laravel mediante sesiones.
Características del Sistema
Módulo de Usuarios

    Autenticación de usuarios mediante sesiones de Laravel

    Roles y permisos diferenciados (Solicitante, Aprobador, Administrador)

    Gestión de perfiles de usuario

    Historial de solicitudes por usuario

Módulo de Viáticos

    Solicitud de viáticos con asignación de presupuesto por viaje

    Definición de tipos de gasto permitidos (transporte, alimentación, hospedaje, etc.)

    Asignación de fechas de viaje (salida y regreso)

    Destino y motivo del viaje

    Presupuesto estimado vs presupuesto aprobado

Módulo de Rendición de Gastos

    Registro de gastos individuales con:

        Fecha del gasto

        Tipo de gasto

        Monto

        Descripción

        Comprobante digital (carga de imagen/PDF)

    Asociación de cada gasto a una solicitud de viático específica

    Validación de montos rendidos contra el presupuesto asignado

    Estado de rendición: Pendiente, Parcial, Completada, Rechazada

Módulo de Aprobaciones

    Flujo de aprobación de solicitudes de viáticos

    Flujo de aprobación de rendiciones de gastos

    Comentarios y observaciones en rechazos

    Notificaciones de cambios de estado

Módulo de Reportes

    Reporte de gastos por usuario

    Reporte de gastos por período

    Reporte de cumplimiento de presupuesto

    Exportación de reportes a Excel/PDF

Características Técnicas

    API RESTful con Laravel 5.6

    SPA con Vue 2 + Vue Router + Vuex

    Autenticación vía sesiones Laravel (sin tokens JWT)

    Validación de formularios con VeeValidate

    Notificaciones en tiempo real con Vue Toast / SweetAlert2

    Manejo de archivos (comprobantes) con validación de tipos y tamaños

    Tablas dinámicas con Vue Tables 2

    Formateo de moneda con Vue Currency Filter

    Formateo de fechas con Vue Moment

Estados del Flujo

Solicitud de Viático:

    Borrador

    En Aprobación

    Aprobado

    Rechazado

    En Rendición

    Cerrado

Rendición de Gastos:

    En Preparación

    Presentada

    En Revisión

    Aprobada

    Rechazada

    Pagada

Reglas de Negocio

    Un usuario no puede rendir gastos sin una solicitud de viáticos aprobada

    Los gastos rendidos no pueden superar el presupuesto aprobado

    Los comprobantes son obligatorios para gastos superiores a un monto configurable

    Fecha límite para rendición posterior al término del viaje

    Historial de auditoría de todas las acciones (creación, modificación, aprobación)

Seguridad

    Middleware de autenticación en todas las rutas protegidas

    Verificación de permisos por rol en cada acción

    Sanitización de entradas

    Protección CSRF (manejada por Laravel)

    Registro de logs de acciones críticas