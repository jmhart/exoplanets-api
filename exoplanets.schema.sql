CREATE SCHEMA [exoplanets]
GO

CREATE TABLE [exoplanets].[systems] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [distance] decimal NOT NULL,
  [star_id] integer
)
GO

CREATE TABLE [exoplanets].[stars] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [mass] nvarchar(255) NOT NULL,
  [radius] nvarchar(255) NOT NULL,
  [system_id] integer,
  [planet_id] integer
)
GO

CREATE TABLE [exoplanets].[planets] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [mass] nvarchar(255) NOT NULL,
  [radius] nvarchar(255) NOT NULL,
  [status_id] integer
)
GO

CREATE TABLE [exoplanets].[planet_status] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [status_name] nvarchar(255) UNIQUE NOT NULL
)
GO

ALTER TABLE [exoplanets].[systems] ADD FOREIGN KEY ([star_id]) REFERENCES [exoplanets].[stars] ([id])
GO

ALTER TABLE [exoplanets].[stars] ADD FOREIGN KEY ([system_id]) REFERENCES [exoplanets].[systems] ([id])
GO

ALTER TABLE [exoplanets].[stars] ADD FOREIGN KEY ([planet_id]) REFERENCES [exoplanets].[planets] ([id])
GO

ALTER TABLE [exoplanets].[planets] ADD FOREIGN KEY ([status_id]) REFERENCES [exoplanets].[planet_status] ([id])
GO
