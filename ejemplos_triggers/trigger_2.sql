CREATE OR REPLACE FUNCTION before_update_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Modificar el valor de NEW antes de la actualización
    IF NEW.salary < OLD.salary THEN
        NEW.salary := OLD.salary;  -- No permitir una reducción en el salario
    END IF;
    RETURN NEW;  -- Devuelve la fila modificada
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER my_before_update_trigger
BEFORE UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION before_update_trigger();
