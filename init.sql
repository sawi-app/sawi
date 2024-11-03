-- Create function to generate nanoid
CREATE OR REPLACE FUNCTION nanoid(length INTEGER DEFAULT 21)
RETURNS TEXT AS $$
DECLARE
    alphabet CONSTANT TEXT := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    id TEXT := '';
    i INT;
BEGIN
    FOR i IN 1..length LOOP
        id := id || substr(alphabet, (floor(random() * length(alphabet)::int) + 1)::INTEGER, 1);
    END LOOP;
    RETURN id;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------------------------------
-- Trigger on table Movement to link with table Ventilation each
-- Drop existing trigger and function if they exist
DROP TRIGGER IF EXISTS trigger_insert_ventilation ON public."Movement";
DROP FUNCTION IF EXISTS insert_into_ventilation();

-- Re-create the function
CREATE OR REPLACE FUNCTION insert_into_ventilation()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO "Ventilation" (
        id, "idOrg", "idEtb", "idMovement", "idHeader", "idStockpile", "idArticle", qty,
        "idUnit", "idTax", "idVat", "untaxedAmount", "taxedAmount", "createdAt", "artTax", "codeOperation"
    )
    VALUES (
        nanoid(),  -- Generate a new ID for the id in Ventilation
        NEW."idOrg",
        NEW."idEtb",
        NEW.id,  -- Use Movement's ID as idMovement in Ventilation
        NEW."idHeader",
        NULL,  -- Assuming idStockpile is NULL, or set a default value if needed
        NEW."idArticle",
        NEW.qty,
        NEW."idUnit",
        NEW."idTax",
        NEW."idVat",
        NEW."untaxedAmount",
        NEW."taxedAmount",
        NEW."createdAt",
        NEW."artTax",
        NEW."codeOperation"
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Re-create the trigger
CREATE TRIGGER trigger_insert_ventilation
AFTER INSERT ON public."Movement"
FOR EACH ROW
EXECUTE FUNCTION insert_into_ventilation();

---------------------------------------------------------------------------------------------------
-- Trigger on table Movement to link with table Ventilation each
-- Drop existing trigger and function if they exist
DROP TRIGGER IF EXISTS trigger_insert_stockpile ON "Ventilation";
DROP FUNCTION IF EXISTS insert_into_stockpile();
CREATE OR REPLACE FUNCTION insert_into_stockpile()
RETURNS TRIGGER AS $$
DECLARE
    new_stockpile_id TEXT; -- Use TEXT to store the nanoid
BEGIN
    -- Insert a new row into Stockpile and get its ID
    INSERT INTO "Stockpile" (
        id, "idOrg", "idEtb", "idDeposit", "idLocation", "idArticle", "qtyReal", "qtyVirtual", "qtyReserved"
    )
    VALUES (
        nanoid(),  -- Generate a new nanoid for the id in Stockpile
        NEW."idOrg",
        NEW."idEtb",
        NULL,               -- Assuming idDeposit is NULL; set default if needed
        NULL,               -- Assuming idLocation is NULL; set default if needed
        NEW."idArticle",
        0,                  -- Initial qtyReal
        0,                  -- Initial qtyVirtual
        0                   -- Initial qtyReserved
    )
    RETURNING id INTO new_stockpile_id;

    -- Update qtyReal, qtyVirtual, and qtyReserved in Stockpile based on codeOperation
    UPDATE "Stockpile"
    SET
        "qtyReal" = CASE SUBSTRING(NEW."codeOperation" FROM 1 FOR 1)
                    WHEN 'A' THEN COALESCE("qtyReal", 0) + NEW.qty
                    WHEN 'M' THEN COALESCE("qtyReal", 0) - NEW.qty
                    ELSE "qtyReal"  -- 'U' or any other value means unchanged
                  END,
        "qtyVirtual" = CASE SUBSTRING(NEW."codeOperation" FROM 2 FOR 1)
                       WHEN 'A' THEN COALESCE("qtyVirtual", 0) + NEW.qty
                       WHEN 'M' THEN COALESCE("qtyVirtual", 0) - NEW.qty
                       ELSE "qtyVirtual"
                     END,
        "qtyReserved" = CASE SUBSTRING(NEW."codeOperation" FROM 3 FOR 1)
                        WHEN 'A' THEN COALESCE("qtyReserved", 0) + NEW.qty
                        WHEN 'M' THEN COALESCE("qtyReserved", 0) - NEW.qty
                        ELSE "qtyReserved"
                      END
    WHERE id = new_stockpile_id;

    -- Update the idStockpile field in Ventilation with the new Stockpile ID
    UPDATE "Ventilation"
    SET "idStockpile" = new_stockpile_id
    WHERE id = NEW.id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger on Ventilation to invoke the function after insert
CREATE TRIGGER trigger_insert_stockpile
AFTER INSERT ON public."Ventilation"
FOR EACH ROW
EXECUTE FUNCTION insert_into_stockpile();
