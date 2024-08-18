CREATE OR REPLACE FUNCTION after_update_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Registrar el cambio en una tabla de auditoría
    INSERT INTO audit_log (employee_id, old_salary, new_salary, change_date)
    VALUES (OLD.id, OLD.salary, NEW.salary, NOW());
    RETURN NEW;  -- Devuelve la fila final después de la actualización
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER my_after_update_trigger
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION after_update_trigger();
