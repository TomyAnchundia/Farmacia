/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     1/27/2021 10:03:19 PM                        */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DESCUENTO')
            and   type = 'U')
   drop table DESCUENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_PRODUCTO')
            and   name  = 'VENTA_TIENE_DETALLE_PRODUC_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_PRODUCTO.VENTA_TIENE_DETALLE_PRODUC_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_PRODUCTO')
            and   name  = 'PRODUCTO_TIENE_DETALLE_PRODUC_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_PRODUCTO.PRODUCTO_TIENE_DETALLE_PRODUC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_PRODUCTO')
            and   type = 'U')
   drop table DETALLE_PRODUCTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTADO_VENDEDOR')
            and   type = 'U')
   drop table ESTADO_VENDEDOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FARMACIA')
            and   type = 'U')
   drop table FARMACIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'SUCURSAL_TIENE_PRODUCTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.SUCURSAL_TIENE_PRODUCTO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'PROVEEDOR_TIENE_PRODUCTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.PROVEEDOR_TIENE_PRODUCTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTO')
            and   type = 'U')
   drop table PRODUCTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROVEEDOR')
            and   name  = 'FARMACIA_TIENE_PROVEEDOR_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROVEEDOR.FARMACIA_TIENE_PROVEEDOR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVEEDOR')
            and   type = 'U')
   drop table PROVEEDOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUCURSAL')
            and   name  = 'FARMACIA_TIENE_SUCURSAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUCURSAL.FARMACIA_TIENE_SUCURSAL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUCURSAL')
            and   type = 'U')
   drop table SUCURSAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDEDOR')
            and   name  = 'SUCURSAL_TIENE_VENDEDORES_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDEDOR.SUCURSAL_TIENE_VENDEDORES_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDEDOR')
            and   name  = 'VENDEDOR_TIENE_ESTADO_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDEDOR.VENDEDOR_TIENE_ESTADO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDEDOR')
            and   name  = 'FARMACIA_TIENE_VENDEDOR_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDEDOR.FARMACIA_TIENE_VENDEDOR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VENDEDOR')
            and   type = 'U')
   drop table VENDEDOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'CLIENTE_HACE_VENTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.CLIENTE_HACE_VENTA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'DESCUENTO_APLICA_VENTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.DESCUENTO_APLICA_VENTA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'VENDEDOR_REALIZA_VENTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.VENDEDOR_REALIZA_VENTA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'SUCURSAL_TIENE_VENTAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.SUCURSAL_TIENE_VENTAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VENTA')
            and   type = 'U')
   drop table VENTA
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           smallint             not null,
   NOMBRE_CLIENTE       char(300)            not null,
   DIRECCION_CLIENTE    char(300)            not null,
   TELEFONO_CLIENTE     char(25)             not null,
   constraint PK_CLIENTE primary key nonclustered (ID_CLIENTE)
)
go

/*==============================================================*/
/* Table: DESCUENTO                                             */
/*==============================================================*/
create table DESCUENTO (
   ID_DESCUENTO         smallint             not null,
   DESCRIPCION_DESCUENTO smallint             not null,
   constraint PK_DESCUENTO primary key nonclustered (ID_DESCUENTO)
)
go

/*==============================================================*/
/* Table: DETALLE_PRODUCTO                                      */
/*==============================================================*/
create table DETALLE_PRODUCTO (
   ID_DETALLE_PRODUCTO  smallint             not null,
   ID_PRODUCTO          smallint             null,
   ID_VENTA             smallint             null,
   CANTIDAD             int                  null,
   constraint PK_DETALLE_PRODUCTO primary key nonclustered (ID_DETALLE_PRODUCTO)
)
go

/*==============================================================*/
/* Index: PRODUCTO_TIENE_DETALLE_PRODUC_FK                      */
/*==============================================================*/
create index PRODUCTO_TIENE_DETALLE_PRODUC_FK on DETALLE_PRODUCTO (
ID_PRODUCTO ASC
)
go

/*==============================================================*/
/* Index: VENTA_TIENE_DETALLE_PRODUC_FK                         */
/*==============================================================*/
create index VENTA_TIENE_DETALLE_PRODUC_FK on DETALLE_PRODUCTO (
ID_VENTA ASC
)
go

/*==============================================================*/
/* Table: ESTADO_VENDEDOR                                       */
/*==============================================================*/
create table ESTADO_VENDEDOR (
   ID_ESTADO            smallint             not null,
   DESCRIPCION_ESTADO_VENDEDOR bit                  not null,
   constraint PK_ESTADO_VENDEDOR primary key nonclustered (ID_ESTADO)
)
go

/*==============================================================*/
/* Table: FARMACIA                                              */
/*==============================================================*/
create table FARMACIA (
   ID_FARMACIA          smallint             not null,
   NOMBRE_FARMACIA      char(300)            not null,
   constraint PK_FARMACIA primary key nonclustered (ID_FARMACIA)
)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          smallint             not null,
   ID_SUCURSAL          smallint             null,
   ID_PROVEEDOR         smallint             null,
   NOMBRE_PRODUCTO      char(300)            not null,
   COSTO                float                not null,
   PRECIO               float                not null,
   FECHA_VENCIMIENTO    datetime             not null,
   STOCK                smallint             not null,
   constraint PK_PRODUCTO primary key nonclustered (ID_PRODUCTO)
)
go

/*==============================================================*/
/* Index: PROVEEDOR_TIENE_PRODUCTO_FK                           */
/*==============================================================*/
create index PROVEEDOR_TIENE_PRODUCTO_FK on PRODUCTO (
ID_PROVEEDOR ASC
)
go

/*==============================================================*/
/* Index: SUCURSAL_TIENE_PRODUCTO_FK                            */
/*==============================================================*/
create index SUCURSAL_TIENE_PRODUCTO_FK on PRODUCTO (
ID_SUCURSAL ASC
)
go

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   ID_PROVEEDOR         smallint             not null,
   ID_FARMACIA          smallint             null,
   NOMBRE_RAZON_SOCIAL  char(300)            not null,
   TELEFONO_PROVEEDOR   char(25)             null,
   constraint PK_PROVEEDOR primary key nonclustered (ID_PROVEEDOR)
)
go

/*==============================================================*/
/* Index: FARMACIA_TIENE_PROVEEDOR_FK                           */
/*==============================================================*/
create index FARMACIA_TIENE_PROVEEDOR_FK on PROVEEDOR (
ID_FARMACIA ASC
)
go

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   ID_SUCURSAL          smallint             not null,
   ID_FARMACIA          smallint             null,
   DIRECCION_SUCURSAL   char(200)            not null,
   TELEFONO_SUCURSAL    char(25)             not null,
   constraint PK_SUCURSAL primary key nonclustered (ID_SUCURSAL)
)
go

/*==============================================================*/
/* Index: FARMACIA_TIENE_SUCURSAL_FK                            */
/*==============================================================*/
create index FARMACIA_TIENE_SUCURSAL_FK on SUCURSAL (
ID_FARMACIA ASC
)
go

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR (
   ID_VENDEDOR          smallint             not null,
   ID_FARMACIA          smallint             null,
   ID_SUCURSAL          smallint             null,
   ID_ESTADO            smallint             null,
   NOMBRE_VENDEDOR      char(300)            not null,
   APELLIDOS__VENDEDOR  char(300)            not null,
   DIRECCION_VENDEDOR   char(300)            not null,
   FECHA_NACIMIENTO     datetime             not null,
   FECHA_INGRESO_LABORAR datetime             not null,
   constraint PK_VENDEDOR primary key nonclustered (ID_VENDEDOR)
)
go

/*==============================================================*/
/* Index: FARMACIA_TIENE_VENDEDOR_FK                            */
/*==============================================================*/
create index FARMACIA_TIENE_VENDEDOR_FK on VENDEDOR (
ID_FARMACIA ASC
)
go

/*==============================================================*/
/* Index: VENDEDOR_TIENE_ESTADO_FK                              */
/*==============================================================*/
create index VENDEDOR_TIENE_ESTADO_FK on VENDEDOR (
ID_ESTADO ASC
)
go

/*==============================================================*/
/* Index: SUCURSAL_TIENE_VENDEDORES_FK                          */
/*==============================================================*/
create index SUCURSAL_TIENE_VENDEDORES_FK on VENDEDOR (
ID_SUCURSAL ASC
)
go

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   ID_VENTA             smallint             not null,
   ID_VENDEDOR          smallint             not null,
   ID_SUCURSAL          smallint             null,
   ID_DESCUENTO         smallint             null,
   ID_CLIENTE           smallint             null,
   FECHA_VENTA          datetime             not null,
   constraint PK_VENTA primary key nonclustered (ID_VENTA)
)
go

/*==============================================================*/
/* Index: SUCURSAL_TIENE_VENTAS_FK                              */
/*==============================================================*/
create index SUCURSAL_TIENE_VENTAS_FK on VENTA (
ID_SUCURSAL ASC
)
go

/*==============================================================*/
/* Index: VENDEDOR_REALIZA_VENTA_FK                             */
/*==============================================================*/
create index VENDEDOR_REALIZA_VENTA_FK on VENTA (
ID_VENDEDOR ASC
)
go

/*==============================================================*/
/* Index: DESCUENTO_APLICA_VENTA_FK                             */
/*==============================================================*/
create index DESCUENTO_APLICA_VENTA_FK on VENTA (
ID_DESCUENTO ASC
)
go

/*==============================================================*/
/* Index: CLIENTE_HACE_VENTA_FK                                 */
/*==============================================================*/
create index CLIENTE_HACE_VENTA_FK on VENTA (
ID_CLIENTE ASC
)
go

