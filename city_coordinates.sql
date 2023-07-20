-- Table creation
CREATE TABLE CityCoordinates (
  ID NUMBER,
  CityName VARCHAR2(100),
  Coordinates SDO_GEOMETRY
);

-- Data insertion
INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  1,
  'New York',
  SDO_GEOMETRY(
    2001, -- Geometry type 2001 corresponds to a point
    4326, -- SRID (Spatial Reference Identifier) for GPS coordinates
    SDO_POINT_TYPE(-74.0060, 40.7128, NULL), -- Longitude, latitude, altitude (optional)
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  2,
  'London',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(-0.1276, 51.5074, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  3,
  'Tokyo',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(139.6917, 35.6895, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  4,
  'Paris',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(2.3522, 48.8566, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  5,
  'Rome',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(12.4964, 41.9028, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  6,
  'Sydney',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(151.2093, -33.8688, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  7,
  'Beijing',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(116.4074, 39.9042, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  8,
  'Mexico City',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(-99.1332, 19.4326, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  9,
  'Sao Paulo',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(-46.6333, -23.5505, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  10,
  'Moscow',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(37.6176, 55.7558, NULL),
    NULL,
    NULL
  )
);

INSERT INTO CityCoordinates (ID, CityName, Coordinates) VALUES (
  11,
  'Valletta',
  SDO_GEOMETRY(
    2001,
    4326,
    SDO_POINT_TYPE(14.5146, 35.8989, NULL),
    NULL,
    NULL
  )
);

-- Add other insertions for desired cities...

-- Procedure creation
CREATE OR REPLACE PROCEDURE CalculateCityDistance (
  p_StartCityName IN CityCoordinates.CityName%TYPE
) AS
  v_StartLongitude CityCoordinates.Coordinates.SDO_POINT.X%TYPE;
  v_StartLatitude CityCoordinates.Coordinates.SDO_POINT.Y%TYPE;
BEGIN
  -- Retrieving coordinates of the starting city
  SELECT Coordinates.SDO_POINT.X, Coordinates.SDO_POINT.Y
  INTO v_StartLongitude, v_StartLatitude
  FROM CityCoordinates
  WHERE CityName = p_StartCityName;

  -- Calculating the distance between cities
  SELECT c.CityName, SDO_GEOM.SDO_DISTANCE(
    c.Coordinates,
    SDO_GEOMETRY(
      2001,
      4326,
      SDO_POINT_TYPE(v_StartLongitude, v_StartLatitude, NULL),
      NULL,
      NULL
    ),
    0.005, 'unit=KM') AS DistanceKM
  FROM CityCoordinates c
  WHERE c.CityName <> p_StartCityName
  ORDER BY DistanceKM DESC;
END;
