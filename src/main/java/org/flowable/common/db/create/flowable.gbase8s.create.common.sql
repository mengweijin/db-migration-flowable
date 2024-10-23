create table ACT_GE_PROPERTY (
    NAME_ VARCHAR(64),
    VALUE_ VARCHAR(300),
    REV_ INTEGER,
    primary key (NAME_)
);

create table ACT_GE_BYTEARRAY (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    NAME_ VARCHAR(255),
    DEPLOYMENT_ID_ VARCHAR(64),
    BYTES_ BLOB,
    GENERATED_ DECIMAL(1,0) CHECK (GENERATED_ IN (1,0)),
    primary key (ID_)
);

insert into ACT_GE_PROPERTY
values ('common.schema.version', '6.8.0.0', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);
