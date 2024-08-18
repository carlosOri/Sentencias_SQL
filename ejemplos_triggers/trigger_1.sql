CREATE OR REPLACE FUNCTION before_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Modificar el valor de NEW antes de la inserción
    IF NEW.salary IS NULL THEN
        NEW.salary := 50000;  -- Asignar un valor por defecto si es NULL
    END IF;
    RETURN NEW;  -- Devuelve la fila modificada
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER my_before_insert_trigger
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION before_insert_trigger();
