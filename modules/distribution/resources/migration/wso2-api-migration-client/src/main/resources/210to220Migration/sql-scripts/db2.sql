ALTER TABLE AM_SUBSCRIPTION_KEY_MAPPING ALTER COLUMN ACCESS_TOKEN SET DATA TYPE VARCHAR(512)
/
ALTER TABLE AM_APPLICATION_REGISTRATION ALTER COLUMN TOKEN_SCOPE SET DATA TYPE VARCHAR(1500)
/
CREATE TABLE AM_CERTIFICATE_METADATA (
  TENANT_ID INT NOT NULL,
  ALIAS VARCHAR(45) NOT NULL,
  END_POINT VARCHAR(100) NOT NULL,
  CONSTRAINT PK_ALIAS PRIMARY KEY (ALIAS),
  CONSTRAINT END_POINT_CONSTRAINT UNIQUE (END_POINT)
) /

CREATE TABLE IF NOT EXISTS AM_APPLICATION_GROUP_MAPPING (
    APPLICATION_ID INTEGER NOT NULL,
    GROUP_ID VARCHAR(512)NOT NULL,
    TENANT VARCHAR(255),
    PRIMARY KEY (APPLICATION_ID,GROUP_ID,TENANT),
    FOREIGN KEY (APPLICATION_ID) REFERENCES AM_APPLICATION(APPLICATION_ID) ON DELETE CASCADE
) /

<!-- There are two other columns to add from Micro Gateway feature -->


create index IDX_IOAT_AT on IDN_OAUTH2_ACCESS_TOKEN (ACCESS_TOKEN)/