CREATE OR REPLACE PROCEDURE insert_order_list(p_commit BOOLEAN)
AS
$$
BEGIN
    -- Realiza la inserción
    INSERT INTO order_list (
        name_order, supplier_id, type_base, temperature, spindle, r_p_m, centipoise, min_centipoise, min_r_p_m, inhivitor_gr, thixotropic_index, cabosil_gr, percentage_o_cobalt, promotor_gr, peroxide_gr, gel_time, amount_gr, state_order, created_at
    )
    VALUES (
        'jt-700.5.t', 5, 'dc-orchem-601', 25, 2, 60, 1280, 4180, 6, 0.057, NULL, 0.00095, NULL, NULL, 1.5, 40.00, 100, 'prepared', CURRENT_DATE
    );

    -- Decidir si confirmar los cambios basados en el parámetro p_commit
    IF p_commit THEN
        COMMIT;  -- Confirmar los cambios si p_commit es TRUE
    ELSE
        ROLLBACK;  -- Deshacer los cambios si p_commit es FALSE
    END IF;
END;
$$
LANGUAGE plpgsql;


CALL insert_order_list(TRUE);
CALL insert_order_list(FALSE);
